# rubocop:disable Layout/HeredocIndentation
# Markdown depends on this indentation, rubocop wants to enforce
# two leading space.  Rubocop can get lost

markdown_for_literacy = <<-MARKDOWN_FOR_LITERACY
Access resources, activity ideas and advice for teaching literacy skills to early years children.

### Early years literacy resources

[Comprehension]()

[Word reading]()

[Writing]()

### What the early years foundation stage (EYFS) framework says about literacy

It is crucial for children to develop a life-long love of reading. Reading consists of two dimensions: language comprehension and word reading.

### Read more
Language comprehension (necessary for both reading and writing) starts from birth.

It only develops when adults talk with children about the world around them and the books (stories and non-fiction) they read with them, and enjoy rhymes, poems and songs together.

Skilled word reading, taught later, involves both the speedy working out of the pronunciation of unfamiliar printed words (decoding) and the speedy recognition of familiar printed words.

Writing involves transcription (spelling and handwriting) and composition (articulating ideas and structuring them in speech, before writing).
MARKDOWN_FOR_LITERACY

literacy = {
  title: "Literacy",
  markdown: markdown_for_literacy,
  position: 4,
}
literacy_page = ContentPage.new literacy
literacy_page.save!

#####################################################################################
# Child pages below
#
markdown_for_comprehension = <<-MARKDOWN_FOR_COMPREHENSION

This page is still being written.

MARKDOWN_FOR_COMPREHENSION
comprehension = {
  title: "Comprehension",
  markdown: markdown_for_comprehension,
  position: 1,
  parent_id: literacy_page.id,
}
comprehension_page = ContentPage.new comprehension
comprehension_page.save!

#####################################################################################
#
#
markdown_for_word_reading = <<-MARKDOWN_FOR_WORD_READING

This page is still being written.

MARKDOWN_FOR_WORD_READING
word_reading = {
  title: "Word reading",
  markdown: markdown_for_word_reading,
  position: 2,
  parent_id: literacy_page.id,
}
word_reading_page = ContentPage.new word_reading
word_reading_page.save!

#####################################################################################
#
#
markdown_for_writing = <<-MARKDOWN_FOR_WRITING

This page is still being written.

MARKDOWN_FOR_WRITING
writing = {
  title: "Writing",
  markdown: markdown_for_writing,
  position: 3,
  parent_id: literacy_page.id,
}
writing_page = ContentPage.new writing
writing_page.save!
# rubocop:enable Layout/HeredocIndentation
