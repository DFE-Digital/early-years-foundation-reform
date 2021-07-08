# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost

markdown = <<-MARKDOWN
The content for the safeguarding page
MARKDOWN

attrs = {
  title: "Safeguarding",
  markdown: markdown,
  position: 11,
  is_featured: true
}
parent_page = ContentPage.new attrs
parent_page.save!

#####################################################################################
# Child pages below
#
#####################################################################################

markdown = <<-MARKDOWN
This page will also contain links to useful resources in the area of oral health.
MARKDOWN

attrs = {
  title: "Oral health",
  markdown: markdown,
  position: 1,
  parent_id: parent_page.id,
}
page = ContentPage.new attrs
page.save!


#####################################################################################

markdown = <<-MARKDOWN
About food safety
MARKDOWN

attrs = {
  title: "Food safety",
  markdown: markdown,
  position: 2,
  parent_id: parent_page.id,
}
page = ContentPage.new attrs
page.save!
# rubocop:enable Layout/HeredocIndentation
