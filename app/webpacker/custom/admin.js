import $ from 'jquery';

export function createPreview(el, target) {

  $.post( "/govspeak", { input: $(el).val() })
  .done(function( response ) {
    $(target).html( response.html );
  });

}

/* copies to clipboard in content_assets/_clipboard.html.erb */
export function copyToClipboard() {
  var copyText = document.getElementById("clipboard_content");
  copyText.select();
  copyText.setSelectionRange(0, 99999); /* For mobile devices */
  document.execCommand("copy");
}
