module.exports = function (migration) {

  const page = migration.createContentType('helpPage', {
    name: 'Help page',
    displayField: 'slug',
    description: 'Textual Content'
  })

  /* Fields ----------------------------------------------------------------- */

  // displayField
  page.createField('slug', {
    name: 'Slug',
    type: 'Symbol',
    required: true,
    validations: [
      {
        prohibitRegexp: { pattern: '\\.|\\s|[A-Z]' }
      }
    ]
  })

  page.createField('heroTitle', {
    name: 'Hero title',
    type: 'Symbol',
    required: false
  })

  page.createField('heroDescription', {
    name: 'Hero description',
    type: 'Symbol',
    required: false
  })

  page.createField('title', {
    name: 'Title',
    type: 'Text',
    required: false
  })

  page.createField('introduction', {
    name: 'Introduction',
    type: 'Text',
    required: false
  })

  page.createField('contentList', {
    name: 'Content list',
    type: 'Text',
    required: false
  })

  page.createField('body', {
    name: 'Body',
    type: 'Text',
    required: false
  })

  page.createField('metaDescription', {
    name: 'Meta Description',
    type: 'Text',
    required: false
  })

  page.createField('pages', {
    name: 'Pages',
    type: 'Array',
    items: {
      type: 'Link',
      validations: [
        { 'linkContentType': ['helpPage'] }
      ],
      linkType: 'Entry'
    }
  })

  page.createField('pageStyle', {
    name: 'Page style',
    type: 'Symbol',
    required: false,
    validations: [{ 'in': ['default', 'cards', 'side-nav'] }]
  })

  page.createField('image', {
    name: 'Image',
    type: 'Link',
    linkType: 'Asset',
    required: false
  })

  /* Interface -------------------------------------------------------------- */

  page.changeFieldControl('pages', 'builtin', 'entryCardsEditor', {
    helpText: 'Define module content and order here.',
  })

  page.changeFieldControl('image', 'builtin', 'assetLinkEditor', {
    helpText: 'Select thumbnail image.',
  })

  /* text */

  page.changeFieldControl('title', 'builtin', 'multipleLine', {
    helpText: 'Page heading',
  })

  /* markdown */

  page.changeFieldControl('body', 'builtin', 'markdown', {
    helpText: 'All page content including sub-headings, bullet points and images.',
  })
}
