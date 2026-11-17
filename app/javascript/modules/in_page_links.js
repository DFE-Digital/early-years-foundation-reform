// Turbo intercepts same-page fragment links (e.g. "Contents on this page") and
// only briefly focuses the target, so keyboard and screen reader focus is lost.
// Let the browser handle them natively and move focus to the target section.

const isSamePageFragment = (url) => {
  return url.hash.length > 1 &&
    url.origin === window.location.origin &&
    url.pathname === window.location.pathname &&
    url.search === window.location.search
}

const findTarget = (hash) => {
  const id = decodeURIComponent(hash.slice(1))
  return document.getElementById(id) || document.getElementsByName(id)[0]
}

const focusTarget = (target) => {
  if (!target.hasAttribute('tabindex')) {
    target.setAttribute('tabindex', '-1')
    target.addEventListener('blur', () => target.removeAttribute('tabindex'), { once: true })
  }

  target.focus({ preventScroll: true })
}

document.addEventListener('turbo:click', (event) => {
  const url = new URL(event.detail.url)
  if (!isSamePageFragment(url)) return

  const target = findTarget(url.hash)
  if (!target) return

  event.preventDefault()
  focusTarget(target)
})
