# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost

markdown_for_mathematics = <<-MARKDOWN_FOR_MATHEMATICS
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
MARKDOWN_FOR_MATHEMATICS

mathematics = {
  title: "Maths",
  subtitle: "Access resources, activity ideas and advice for teaching early years maths.",
  markdown: markdown_for_mathematics,
  seo: "Early-Years-Foundation-Stage",
  position: 5,
}
mathematics_page = ContentPage.new mathematics
mathematics_page.save!

#####################################################################################
# Child pages below
#
markdown_for_counting = <<-MARKDOWN_FOR_COUNTING
## Why counting is important

It is an often overlooked fact that we all, whether children or adults, are constantly using and applying mathematics in our everyday lives.

- Research confirms that early experiences have long-lasting outcomes in terms of educational achievement and life chances

- You can make a real difference to ensure every child has a chance to become a confident learner and user of mathematics.

In this video, an expert in early years maths explains what’s changed in the new EYFS for counting in maths and offers some top tips on getting the most out of a child in this area.

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/SYhhCcokBF8/0.jpg)](http://www.youtube.com/watch?v=SYhhCcokBF8)

### Video transcript

## What the EYFS framework says

Children should be able to count confidently, develop a deep understanding of the numbers to 10, the relationships between them and the patterns within those numbers.

## What this means in practice

One of the key methods children use to learn is trial and error; therefore, using a hands-on approach, and allowing them to experiment, is a good way for children to develop their mathematical thinking skills.

Here we’ve suggested just a few examples of the toys and activities you can provide to encourage development in some of the areas of numeracy, for early years.

## Counting activities

[Download activity worksheet](https://eyfs-framework.herokuapp.com/main/ContentRound2Version1/maths/numbers-in-context#) (pdf size???)

![Plates on a table in a nursery ready to start a counting exercise](https://i.ibb.co/nfB1hFc/counting-plates-960x640.jpg)

In this activity, the children will learn about numbers using counters on plates.

![Plates on a table in a nursery ready to start a counting exercise](https://i.ibb.co/R7NBgWc/outdoor-maths-960x640.jpg)

**Outdoor counting activities**

An example of an outdoor counting activity.

## How counting is linked to other areas of the EYFS

If leaders, staff and parents can help to equip young children with a ‘can do’ attitude around maths, giving them the confidence to try things out and discover new skills in the same way they do for other areas of learning, we will have made a massive step in the right direction.

## What other nurseries and childminders are doing

Caroline is Deputy Manager at a nursery in East Midlands.

Caroline adapted the provision and made space for the new counting collections to be put into place within the pre-school area. She introduced one counting collection to a small group of children through an adult-led activity each week for a period of six weeks then adapted it to one counting collection per child following the child’s lead and closely worked with the children with this encouraging different ways of sorting and organising the collections they were counting.

The children are now offered a counting collection in a different area of pre-school each week and this is added onto the weekly planning, the children choose an individual collection and decide what the objects will be counted into (cups, bowls, frames, bags) and how they will record the amount, this has had a positive impact and increased the social working between the children and a great way to group items to get an altogether total and increase the child’s unitary counting.

> Activities had a positive impact and increased the social working between the children

### Check your understanding

- Research confirms that early experiences have long-lasting outcomes in terms of educational achievement and life chances

- You can make a real difference to ensure every child has a chance to become a confident learner and user of mathematics


- Be positive about maths. Don't say things like “I can’t do maths” or “I hated maths at school”

- Point out the maths in everyday life. Include children in activities involving maths such as using money, cooking, travelling or finding the correct house number

- Praise children for effort rather than talent. This shows them that by working hard they can always improve
MARKDOWN_FOR_COUNTING
counting = {
  title: "Counting",
  subtitle: "Counting Subtitle",
  markdown: markdown_for_counting,
  seo: "Early-Years-Foundation-Stage",
  position: 1,
  parent_id: mathematics_page.id,
}
counting_page = ContentPage.new counting
counting_page.save!

#####################################################################################
#
#
markdown_for_number_patterns = <<-MARKDOWN_FOR_NUMBER_PATTERNS

This page is still being written.

MARKDOWN_FOR_NUMBER_PATTERNS
number_patterns = {
  title: "Number Patterns",
  subtitle: "Number Patterns Subtitle",
  markdown: markdown_for_number_patterns,
  seo: "Early-Years-Foundation-Stage",
  position: 2,
  parent_id: mathematics_page.id,
}
number_patterns_page = ContentPage.new number_patterns
number_patterns_page.save!

#####################################################################################
#
#
markdown_for_spatial_reasoning = <<-MARKDOWN_FOR_SPATIAL_REASONING

This page is still being written.

MARKDOWN_FOR_SPATIAL_REASONING
spatial_reasoning = {
  title: "Spatial reasoning",
  subtitle: "Spatial reasoning Subtitle",
  markdown: markdown_for_spatial_reasoning,
  seo: "Early-Years-Foundation-Stage",
  position: 3,
  parent_id: mathematics_page.id,
}
spatial_reasoning_page = ContentPage.new spatial_reasoning
spatial_reasoning_page.save!
# rubocop:enable Layout/HeredocIndentation
