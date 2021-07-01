require "mechanize"
require "faraday"
require "uri"

# A way to find every page link mentioned in a web site
# and to check that the page can be fetched successfully
#
# example usage
# lc = LinkChecker.new "https://help-for-early-years-providers.education.gov.uk"
# lc.check_page
#
# NB There is a rake task to call the link checker on the live site
# rake link_check:check_live_site
#
# Returns an array of any errors found
#
class LinkChecker
  def initialize(top_url)
    @visited = []
    @broken_links = []
    @parser = Mechanize.new
    @top_url = top_url
    @start_of_this_sites_url = start_of_this_sites_url
  end

  def check_the_links
    check_page(@top_url, @top_url)

    puts "\nVisted #{@visited.count.to_s} pages"
    @broken_links.to_s
  end

private

  def start_of_this_sites_url
    uri = URI.parse @top_url
    subdomain = uri.host.split('.').first
    uri.scheme + "://" + subdomain
  end

  def is_page_in_this_site(page_url)
    page_url.start_with? @start_of_this_sites_url
  end

  def test_this_link(link, containing_page)
    response = Faraday.get(link.to_s)
    if response.status >= 300
      @broken_links << { link: link.to_s, on_page: containing_page, message: response.status.to_s + " " + response.reason_phrase}
      print "*"
    else
      print "."
    end
  rescue Faraday::SSLError => ssl_exception
    @broken_links << { link: link.to_s, on_page: containing_page, message: ssl_exception.message}
    print "*"
  rescue Exception => e
    @broken_links << { link: link.to_s, on_page: containing_page, message: e.message}
    print "*"
  end

  def check_page(page_url, containing_page)
    # Does this call slow it down ?
    unless @visited.include?(page_url)
      @visited << page_url
      test_this_link(page_url, containing_page)

      if is_page_in_this_site(page_url.to_s)
        begin
          if (!page_url.to_s.include? "mailto")
            page_body = @parser.get(page_url)
            page_body.links.each do |link|
              check_page(link.resolved_uri, page_url)
            end
          end
        rescue Mechanize::UnsupportedSchemeError => unsupported_scheme_error
          # puts "Ignoring an email address"
        rescue Exception => e
          print "*"
          @broken_links << { link: page_url.to_s, message: e.message}
        end
      end
    end
  end
end
