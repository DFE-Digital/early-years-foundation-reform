desc "Check for broken links"
namespace :link_check do
  desc "Check the live site for broken links"
  task check_live_site: :environment do
    puts "Checking for broken links on the live site"
    lc = LinkChecker.new "https://help-for-early-years-providers.education.gov.uk/"
    results = lc.check_the_links

    puts results.to_s
  end
end
