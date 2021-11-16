# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost

markdown = <<-MARKDOWN
The changes to the early years foundation stage (EYFS) framework include a number of updates to ways of working for early years practitioners.

Four guiding principles should shape practice in early years settings. These are:

every child is a unique child, who is constantly learning and can be resilient, capable, confident and self-assured
children learn to be strong and independent through positive relationships
children learn and develop well in enabling environments with teaching and support from adults, who respond to their individual interests and needs and help them to build their learning over time. Children benefit from a strong partnership between practitioners and parents and/or carers.
importance of learning and development. Children develop and learn at different rates. The framework covers the education and care of all children in early years provision, including children with special educational needs and disabilities (SEND).
In this section you will find guidance about:
Planning
Reducing paperwork
Identifying and supporting children with special educational needs and disability (SEND)
Oral health
Working in partnership with parents
MARKDOWN

attrs = {
  title: "Get help to improve your practice",
  markdown: markdown,
  position: 8,
}
parent_page = ContentPage.new attrs
parent_page.save!

#####################################################################################
# Child pages below
#
markdown = <<-MARKDOWN
This content will cover how early years settings can plan their curriculum with some advice and best practices for planning.

The content could also cover key differences in the new EYFS, how to look at what they already cover with the children and where they may need to make changes.

The content will give advice for nursery leaders on providing staff training on the curriculum and identifying gaps in knowledge.
MARKDOWN

attrs = {
  title: "Planning",
  markdown: markdown,
  position: 1,
  parent_id: parent_page.id,
}
page = ContentPage.new attrs
page.save!

#####################################################################################
#
#
markdown = <<-MARKDOWN
This content will cover why reducing paperwork is one of the key aims of the reforms. It will provide guidance on what should and shouldn’t be recorded, and how to make effective observations.

The content may contain some case studies from EYFS early adopters about how they’ve managed to balance making effective observations with reducing paperwork.

The content may include links to the relevant parts of Development Matters, information from Ofsted and other useful documents.
MARKDOWN

attrs = {
  title: "Reducing paperwork",
  markdown: markdown,
  position: 2,
  parent_id: parent_page.id,
}
page = ContentPage.new attrs
page.save!

#####################################################################################
#
#
markdown = <<-MARKDOWN
This content will cover a definition of special educational needs and disability (SEND) and advice on identifying children with SEND. It may also include examples or case studies to show how to support the early identification of SEND.

It may include examples or case studies showing how best to support children with SEND in your setting, how to work with parents of children with SEND and how to work with other authorities.

There will be links to useful resources including the SEND Code of Practice.
MARKDOWN

attrs = {
  title: "Identifying and supporting children with special educational needs and disability",
  markdown: markdown,
  position: 3,
  parent_id: parent_page.id,
}
page = ContentPage.new attrs
page.save!

#####################################################################################

markdown = <<-MARKDOWN
The content on this page will cover what the changes are and why they’ve changed, along with the importance of oral health.

Many settings are already covering oral health alongside other work to promote health so it may not need to be a significant extra requirement. Different approaches will work best for different settings.

This page will also contain links to useful resources in the area of oral health.
MARKDOWN

attrs = {
  title: "Promoting oral health as part of the safeguarding and welfare requirements",
  markdown: markdown,
  position: 4,
  parent_id: parent_page.id,
}
page = ContentPage.new attrs
page.save!

#####################################################################################

markdown = <<-MARKDOWN
This content will cover the importance and benefits of good relationships with parents, including how having good relationships with parents can help children settle in to a childcare setting.

It will also cover:

advice on how often to give updates
managing parental expectations
suggestions for the types of updates that could be given
advice on raising concerns with parents
This area has some overlap with reducing paperwork.

This content may contain case studies or advice from practitioners giving tips for working in partnership with parents.

We may also link to other helpful resources.
MARKDOWN

attrs = {
  title: "Working in partnership with parents",
  markdown: markdown,
  position: 5,
  parent_id: parent_page.id,
}
page = ContentPage.new attrs
page.save!
# rubocop:enable Layout/HeredocIndentation
