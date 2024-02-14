module.exports = function (migration) {

  const resource = migration.createContentType('resource', {
    name: 'Resource',
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

  resource.createField('body', {
    name: 'Body',
    type: 'Text',
    required: true,
  })

  /* Interface -------------------------------------------------------------- */

  resource.changeFieldControl('name', 'builtin', 'singleLine', {
    helpText: 'Unique I18n locale key in the format: "this_foo.that_bar.baz"'
  })

  /* markdown */

  resource.changeFieldControl('body', 'builtin', 'markdown', {
    helpText: 'Plain text or markdown supported. Styling, variables and pre-built markup are supported.'
  })

}
