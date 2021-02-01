import $ from 'jquery';

export function createPreview(el, target) {

  const showdown = require('showdown');
  const previewContent = $(el).val();
  const sanitizeContent = previewContent.replace(/<\/?[^>]+(>|$)/g, ""); //remove tags
  const converter = new showdown.Converter();

  $(target).html(converter.makeHtml(sanitizeContent))

}

