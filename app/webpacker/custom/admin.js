export function createPreview(el, target) {

  const showdown = require('showdown');

  document.getElementById(el).addEventListener('keyup', function() {

    const previewContent = document.getElementById(el).value;
    const santizedContent = previewContent.replace(/<\/?[^>]+(>|$)/g, ""); //remove tags

    let converter = new showdown.Converter();
    document.getElementById(target).innerHTML = converter.makeHtml(santizedContent);

  });

}