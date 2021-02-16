import $ from 'jquery';

export function createPreview(el, target) {

  $.post( "/govspeak", { input: $(el).val() })
  .done(function( response ) {
    $(target).html( response.html );
  });

}


