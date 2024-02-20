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

  /* Interface -------------------------------------------------------------- */

  resource.changeFieldControl('name', 'builtin', 'singleLine', {
    helpText: 'Unique I18n locale key in the format: "this_foo.that_bar.baz"'
  })

  resource.changeFieldControl('title', 'builtin', 'multipleLine', {
    helpText: 'Page heading',
  })

  /* markdown */

  resource.changeFieldControl('body', 'builtin', 'markdown', {
    helpText: 'Plain text or markdown supported. Styling, variables and pre-built markup are supported.'
  })

}
