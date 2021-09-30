# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost

markdown_for_help_managing_childrens_behaviour = <<-MARKDOWN_FOR_HELP_MANAGING_CHILDRENS_BEHAVIOUR

Access resources, activity ideas and advice for teaching communication and language to early years children.

## Support for staff mental health and wellbeing
[Interactions]()

[Exploring language]()

[Listening and understanding]()


## What the early years foundation stage (EYFS) framework says about communication and language
The development of children's spoken language underpins all seven areas of learning and development.

### Read more
Children's back-and-forth interactions from an early age form the foundations for language and cognitive development.
The number and quality of the conversations they have with adults and peers throughout the day in a language-rich environment is crucial.
By commenting on what children are interested in or doing, and echoing back what they say with new vocabulary added, practitioners will build children's language effectively.
Reading frequently to children, and engaging them actively in stories, non-fiction, rhymes and poems, and then providing them with extensive opportunities to use and embed new words in a range of contexts, will give children the opportunity to thrive.
Through conversation, story-telling and role play, where children share their ideas with support and modelling from their teacher, and sensitive questioning that invites them to elaborate, children become comfortable using a rich range of vocabulary and language structures
MARKDOWN_FOR_HELP_MANAGING_CHILDRENS_BEHAVIOUR

help_managing_childrens_behaviour = {
  title: "Help managing childrens behaviour",
  markdown: markdown_for_help_managing_childrens_behaviour,
  description: "Help managing childrens behaviour"
}
help_managing_childrens_behaviour_page = Article.new help_managing_childrens_behaviour
help_managing_childrens_behaviour_page.save!

# rubocop:enable Layout/HeredocIndentation
