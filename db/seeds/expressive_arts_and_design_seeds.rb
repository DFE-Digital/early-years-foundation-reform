# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost

markdown_for_expressive_arts_and_design = <<-MARKDOWN_FOR_EXPRESSIVE_ARTS_AND_DESIGN
Access resources, activity ideas and advice for teaching early years maths.

### Early years maths resources

[Counting]()

[Number patterns]()

[Spatial reasoning]()

### What the EYFS framework says about maths

Developing a strong grounding in number is essential so that all children develop the necessary building blocks to excel mathematically.

### Read more

Children should be able to count confidently, develop a deep understanding of the numbers to 10, the relationships between them and the patterns within those numbers.

By providing frequent and varied opportunities to build and apply this understanding - such as using manipulatives, including small pebbles and tens frames for organising counting - children will develop a secure base of knowledge and vocabulary from which mastery of mathematics is built.

In addition, it is important that the curriculum includes rich opportunities for children to develop their spatial reasoning skills across all areas of mathematics including shape, space and measures.

It is important that children develop positive attitudes and interests in mathematics, look for patterns and relationships, spot connections, ‘have a go’, talk to adults and peers about what they notice and not be afraid to make mistakes.
MARKDOWN_FOR_EXPRESSIVE_ARTS_AND_DESIGN

expressive_arts_and_design = {
  title: "Expressive arts and design",
  subtitle: "Access resources, activity ideas and advice for teaching expressive arts and design to early years children.",
  markdown: markdown_for_expressive_arts_and_design,
  seo: "Early-Years-Foundation-Stage",
  position: 7,
}
expressive_arts_and_design_page = ContentPage.new expressive_arts_and_design
expressive_arts_and_design_page.save!

#####################################################################################
# Child pages below
#
markdown_for_imagination_and_creativity = <<-MARKDOWN_FOR_IMAGINATION_AND_CREATIVITY

This page is still being written.

MARKDOWN_FOR_IMAGINATION_AND_CREATIVITY
imagination_and_creativity = {
  title: "Imagination and creativity",
  subtitle: "Imagination and creativity Subtitle",
  markdown: markdown_for_imagination_and_creativity,
  seo: "Early-Years-Foundation-Stage",
  position: 1,
  parent_id: expressive_arts_and_design_page.id,
}
imagination_and_creativity_page = ContentPage.new imagination_and_creativity
imagination_and_creativity_page.save!

#####################################################################################
#
#
markdown_for_self_expression = <<-MARKDOWN_FOR_SELF_EXPRESSION

This page is still being written.

MARKDOWN_FOR_SELF_EXPRESSION
self_expression = {
  title: "Self expression",
  subtitle: "Self expression Subtitle",
  markdown: markdown_for_self_expression,
  seo: "Early-Years-Foundation-Stage",
  position: 2,
  parent_id: expressive_arts_and_design_page.id,
}
self_expression_page = ContentPage.new self_expression
self_expression_page.save!

#####################################################################################
#
#
markdown_for_communicating_through_arts = <<-MARKDOWN_FOR_COMMUNICATING_THROUGH_ARTS

This page is still being written.

MARKDOWN_FOR_COMMUNICATING_THROUGH_ARTS
communicating_through_arts = {
  title: "Communicating through arts",
  subtitle: "Communicating through arts Subtitle",
  markdown: markdown_for_communicating_through_arts,
  seo: "Early-Years-Foundation-Stage",
  position: 3,
  parent_id: expressive_arts_and_design_page.id,
}
communicating_through_arts_page = ContentPage.new communicating_through_arts
communicating_through_arts_page.save!
# rubocop:enable Layout/HeredocIndentation
