module.exports = function (migration) {

  const page = migration.createContentType('page', {
    name: 'Page',
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

  page.createField('title', {
    name: 'title',
    type: 'Text',
    required: false
  })

  page.createField('body', {
    name: 'Body',
    type: 'Text',
    required: false
  })

  page.createField('contentList', {
    name: 'Content list',
    type: 'Text',
    required: false
  })

  page.createField('page_abstract', {
    name: 'Hero',
    type: 'Link',
    linkType: 'Asset',
    required: false,
    validations: [
      { 'linkContentType': ['resource'] }
    ],
    linkType: 'Entry'
  })

  page.createField('pages', {
    name: 'Pages',
    type: 'Array',
    items: {
      type: 'Link',
      validations: [
        { 'linkContentType': ['page'] }
      ],
      linkType: 'Entry'
    }
  })

  page.createField('image', {
    name: 'Image',
    type: 'Link',
    linkType: 'Asset',
    required: true
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
    helpText: 'Page heading, h1.',
  })

  /* markdown */

  page.changeFieldControl('body', 'builtin', 'markdown', {
    helpText: 'All page content including sub-headings, bullet points and images.',
  })
}
