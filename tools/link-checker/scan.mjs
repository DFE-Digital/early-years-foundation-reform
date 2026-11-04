import * as cheerio from "cheerio";

async function main() {
  const websiteRoot = process.env.WEBSITE_ROOT;
  if (!websiteRoot) {
    throw new Error("WEBSITE_ROOT environment variable is not set");
  }

  const root = new URL(websiteRoot);
  if (!["http:", "https:"].includes(root.protocol)) {
    throw new Error("WEBSITE_ROOT must use HTTP or HTTPS");
  }

  root.hash = "";

  const queue = [root.href];
  const sources = new Map([[root.href, new Set()]]);
  const failures = new Map();
  const warnings = new Map();
  const warningStatuses = new Set([301, 403, 307]);
  const maxUrls = 1000;
  let incomplete = false;

  for (const url of queue) {
    try {
      const response = await fetch(url, {
        signal: AbortSignal.timeout(15_000),
      });
      console.log(`${response.status}: ${url}`);

      if (response.status === 307) {
        console.log({
          requestedUrl: url,
          finalUrl: response.url,
          location: response.headers.get("location"),
          redirected: response.redirected,
        });
      }

      if (!response.ok) {
        const results = warningStatuses.has(response.status)
          ? warnings
          : failures;

        results.set(url, `HTTP ${response.status}`);
        await response.body?.cancel();
        continue;
      }

      // URL we actually reached, after redirects if any
      const finalUrl = new URL(response.url);
      const isInternal =
        new URL(url).origin === root.origin && finalUrl.origin === root.origin;
      const isHtml = (response.headers.get("content-type") || "").includes(
        "text/html",
      );

      if (!isInternal || !isHtml) {
        await response.body?.cancel();
        continue;
      }

      const $ = cheerio.load(await response.text());
      const baseHref = $("base[href]").first().attr("href");
      const baseUrl = baseHref ? new URL(baseHref, response.url) : finalUrl;

      for (const element of $("a[href]").toArray()) {
        const href = $(element).attr("href").trim();
        if (!href || href.startsWith("#")) continue;

        let target;
        try {
          target = new URL(href, baseUrl);
        } catch {
          console.error(`Invalid URL: ${href} on ${response.url}`);
          process.exitCode = 1;
          continue;
        }

        if (!["http:", "https:"].includes(target.protocol)) continue;

        target.hash = "";
        const destination = target.href;

        if (!sources.has(destination)) {
          if (queue.length >= maxUrls) {
            incomplete = true;
            continue;
          }

          sources.set(destination, new Set());
          queue.push(destination);
        }
        sources.get(destination).add(url);
      }
    } catch (error) {
      failures.set(url, error.cause?.message ?? error.message);
    }
  }

  for (const [label, results] of [
    ["WARN", warnings],
    ["FAIL", failures],
  ]) {
    for (const [url, reason] of results) {
      console.log(`\n${label}: ${url}\n  Reason: ${reason}`);

      for (const source of sources.get(url)) {
        console.log(`  Found on: ${source}`);
      }
    }
  }

  if (incomplete) {
    console.error(`Scan incomplete: reached the ${maxUrls} URL limit.`);
  }

  console.log(
    `\nChecked ${queue.length} URLs; ` +
      `${failures.size} failed; ${warnings.size} warnings.`,
  );

  if (failures.size > 0 || incomplete) {
    process.exitCode = 1;
  }
}

main().catch((error) => {
  console.error(`Link checker failed: ${error.message}`);
  process.exitCode = 1;
});
