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
  User.create! do |u|
    u.email = "guy@home.com"
    u.password = "guyguy"
  end
end

# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost
markdown_for_counting = <<-MARKDOWN_FOR_COUNTING
## Why counting is important.
It is an often overlooked fact that we all, whether children or adults, are constantly using and applying mathematics in our everyday lives.
- Research confirms that early experiences have long-lasting outcomes in terms of educational achievement and life chances
- You can make a real difference to ensure every child has a chance to become a confident learner and user of mathematics.
In this video, an expert in early years maths explains what’s changed in the new EYFS for counting in maths and offers some top tips on getting the most out of a child in this area.
![A picture](https://early-years-foundation-reform.herokuapp.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--672e1613af7fe76638d6cd5b52a41503001ccdac/counting3.png)
## What the EYFS framework says
Children should be able to count confidently, develop a deep understanding of the numbers to 10, the relationships between them and the patterns within those numbers.
## What this means in practice
One of the key methods children use to learn is trial and error; therefore, using a hands-on approach, and allowing them to experiment, is a good way for children to develop their mathematical thinking skills.
Here we’ve suggested just a few examples of the toys and activities you can provide to encourage development in some of the areas of numeracy, for early years.
![Counting Picture](https://early-years-foundation-reform.herokuapp.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--533a87034b0ac7630e36dd9a59591fea63b060be/counting1.png)
## How counting is linked to other areas of the EYF
![Counting tower](https://early-years-foundation-reform.herokuapp.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b356e91dab8ad0ad064109e58ff1770db7f77b38/counting2.png)
If leaders, staff and parents can help to equip young children with a ‘can do’ attitude around maths, giving them the confidence to try things out and discover new skills in the same way they do for other areas of learning, we will have made a massive step in the right direction.
## What other nurseries and childminders are doing
Caroline is Deputy Manager at a nursery in East Midlands.
Caroline adapted the provision and made space for the new counting collections to be put into place within the pre-school area. She introduced one counting collection to a small group of children through an adult-led activity each week for a period of six weeks then adapted it to one counting collection per child following the child’s lead and closely worked with the children with this encouraging different ways of sorting and organising the collections they were counting.
The children are now offered a counting collection in a different area of pre-school each week and this is added onto the weekly planning, the children choose an individual collection and decide what the objects will be counted into (cups, bowls, frames, bags) and how they will record the amount, this has had a positive impact and increased the social working between the children and a great way to group items to get an altogether total and increase the child’s unitary counting.
## Check your understanding
- Research confirms that early experiences have long-lasting outcomes in terms of educational achievement and life chances
- You can make a real difference to ensure every child has a chance to become a confident learner and user of mathematics.
- Be positive about maths. Don't say things like “I can’t do maths” or “I hated maths at school”
- Point out the maths in everyday life. Include children in activities involving maths such as using money, cooking, travelling or finding the correct house number.
- Praise children for effort rather than talent. This shows them that by working hard they can always improve.
MARKDOWN_FOR_COUNTING
# rubocop:enable Layout/HeredocIndentation
# Talk about OCD rubocop
content_pages = [
  {
    title: "Communication and language",
    subtitle: "Information, guidance, practical support and training for delivering the early years foundation stage (EYFS)",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
    position: 1,
  },
  {
    title: "Physical development",
    subtitle: "Information, guidance, practical support and training for delivering the early years foundation stage (EYFS)",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
    position: 2,
  },
  {
    title: "Personal, social and emotional development",
    subtitle: "Information, guidance, practical support and training for delivering the early years foundation stage (EYFS)",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
    position: 3,
  },
  {
    title: "Literacy",
    subtitle: "Information, guidance, practical support and training for delivering the early years foundation stage (EYFS)",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
    position: 4,
  },
  {
    title: "Maths",
    subtitle: "Information, guidance, practical support and training for delivering the early years foundation stage (EYFS)",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
    position: 5,
  },
  {
    title: "Understanding the world",
    subtitle: "Information, guidance, practical support and training for delivering the early years foundation stage (EYFS)",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
    position: 6,
  },
  {
    title: "Expressive arts and design",
    subtitle: "Information, guidance, practical support and training for delivering the early years foundation stage (EYFS)",
    markdown: "#None yet",
    seo: "Early-Years-Foundation-Stage",
    position: 7,
  },
]

if ContentPage.count.zero?
  content_pages.each do |page|
    new_page = ContentPage.new page

    new_page.save!
  end

  about_counting = {
    title: "Counting",
    subtitle: "Information, guidance, practical support and training for delivering the early years foundation stage (EYFS)",
    markdown: "#None yet",
    seo: "Counting Early Years",
    position: 111,
  }
  counting_page = ContentPage.new about_counting
  counting_page.parent_id = ContentPage.find_by(title: "Maths").id
  counting_page.markdown = markdown_for_counting
  counting_page.save!
end
