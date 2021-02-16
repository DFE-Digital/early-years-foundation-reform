# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost

markdown_for_physical_development = <<-MARKDOWN_FOR_PHYSICAL_DEVELOPMENT

## Physical development

Access resources, activity ideas and advice for supporting early years children with physical development.

## Resources for early years physical development

- Core strength and co-ordination

- Gross motor skills

- Fine motor skills

## What the early years foundation stage (EYFS) framework says about physical development

Physical activity is vital in children’s all-round development, enabling them to pursue happy, healthy and active lives.

<details>
  <summary>
  Read More
  </summary>
Gross and fine motor experiences develop incrementally throughout early childhood, starting with sensory explorations and the development of a child’s strength, co-ordination and positional awareness through tummy time, crawling and play movement with both objects and adults.

By creating games and providing opportunities for play both indoors and outdoors, adults can support children to develop their core strength, stability, balance, spatial awareness, co-ordination and agility.

Gross motor skills provide the foundation for developing healthy bodies and social and emotional well-being.

Fine motor control and precision helps with hand-eye co-ordination which is later linked to early literacy.

Repeated and varied opportunities to explore and play with small world activities, puzzles, arts and crafts and the practise of using small tools, with feedback and support from adults, allow children to develop proficiency, control and confidence.
</details>
MARKDOWN_FOR_PHYSICAL_DEVELOPMENT

physical_development = {
    title: "Physical development",
    subtitle: "Physical development",
    markdown: markdown_for_physical_development,
    seo: "Early-Years-Foundation-Stage",
    position: 5,
}
physical_development_page = ContentPage.new physical_development
physical_development_page.save!
