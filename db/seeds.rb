# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(email: "dev@hfeyp.com")
  User.create! do |u|
    u.email = "dev@hfeyp.com"
    u.password = "Partyw0rd"
  end
end

content_pages = [
  {
    title: "Communication and language",
    subtitle: "Information, guidance, practical support and training for delivering the Early Years foundation Stage (EYFS)",
    slug: "communications-and-language",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
  },
  {
    title: "Physical development",
    subtitle: "Information, guidance, practical support and training for delivering the Early Years foundation Stage (EYFS)",
    slug: "physical-development",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
  },
  {
    title: "Personal, social and emotional development",
    subtitle: "Information, guidance, practical support and training for delivering the Early Years foundation Stage (EYFS)",
    slug: "personal-social-emotional-development",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
  },
  {
    title: "Literacy",
    subtitle: "Information, guidance, practical support and training for delivering the Early Years foundation Stage (EYFS)",
    slug: "literacy",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
  },
  {
    title: "Mathematics",
    subtitle: "Information, guidance, practical support and training for delivering the Early Years foundation Stage (EYFS)",
    slug: "mathematics",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
  },
  {
    title: "Understanding the world",
    subtitle: "Information, guidance, practical support and training for delivering the Early Years foundation Stage (EYFS)",
    slug: "understanding-the-world",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
  },
  {
    title: "Expressive arts and design",
    subtitle: "Information, guidance, practical support and training for delivering the Early Years foundation Stage (EYFS)",
    slug: "expressive-arts-and-design",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
  },
]

if ContentPage.count.zero?
  content_pages.each do |page|
    new_page = ContentPage.new page

    new_page.save!
  end
end
