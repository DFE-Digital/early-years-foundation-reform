module.exports = function (migration) {

  const resource = migration.createContentType('helpResource', {
    name: 'Help resource',
    displayField: 'name',
    description: 'Microcopy snippet'
  })

  /* Fields ----------------------------------------------------------------- */

  // displayField
  resource.createField('name', {
    name: 'Name',
    type: 'Symbol',
    required: true,
    validations: [
      { 'unique': true },
      { 'regexp': { 'pattern': '^[a-z\\._/-]*$' } }
    ]
  })

  resource.createField('title', {
    name: 'Title',
    type: 'Text',
    required: false
  })

  resource.createField('body', {
    name: 'Body',
    type: 'Text',
    required: false,
  })

  resource.createField('link_to', {
    name: 'Link to',
    type: 'Symbol',
    required: false,
  })

  resource.createField('link_to_text', {
    name: 'Link to text',
    type: 'Symbol',
    required: false,
  })

  resource.createField('image', {
    name: 'Image',
    type: 'Link',
    linkType: 'Asset',
    required: false
  })

  resource.createField('resources', {
    name: "Resources",
    type: "Array",
    items: {
      type: "Link",
      linkType: "Entry",
      validations: [
        {
          linkContentType: [
            "helpResource"
          ]
        }
      ]
    }
  })

  /* Interface -------------------------------------------------------------- */

  resource.changeFieldControl('image', 'builtin', 'assetLinkEditor', {
    helpText: 'Select thumbnail image.',
  })

  /* markdown */

  resource.changeFieldControl('body', 'builtin', 'markdown', {
    helpText: 'Plain text or markdown supported. Styling, variables and pre-built markup are supported.'
  })

}
