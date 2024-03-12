# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost

markdown_for_support_for_staff = <<-MARKDOWN_FOR_SUPPORT_FOR_STAFF

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
MARKDOWN_FOR_SUPPORT_FOR_STAFF

support_for_staff = {
  title: 'Support for staff mental health and wellbeing',
  markdown: markdown_for_support_for_staff,
  description: 'Support for staff mental health and wellbeing',
  featured_alt_text: 'Featured alt text',
  thumbnail_alt_text: 'Thumbnail alt text',
}
support_for_staff_page = Article.new support_for_staff
support_for_staff_page.featured_image.attach(io: File.open('spec/fixtures/sample.jpeg'), filename: 'sample.jpeg', content_type: 'image/jpeg')
support_for_staff_page.thumbnail_image.attach(io: File.open('spec/fixtures/sample.jpeg'), filename: 'sample.jpeg', content_type: 'image/jpeg')
support_for_staff_page.save!

# rubocop:enable Layout/HeredocIndentation
