require.context('govuk-frontend/govuk/assets');
require.context('../images', true)

import '../styles/application.scss';
import Rails from 'rails-ujs';
import { initAll } from 'govuk-frontend';
import $ from 'jquery';
import {createPreview} from "custom/admin";

Rails.start();
initAll();

$(document).ready(function() {

  $('#markdown-editor').keyup(function() {
    createPreview('#markdown-editor','#markdown-render');
  });

  
  //----- mobile nav -----//
  
  //show mobile nav when clicking hamburger
  $( ".govuk-js-header-toggle" ).click(function() {
    $( ".app-subnav--mobile" ).toggleClass('app-mobile-nav--active');
  });

  //show subnav links when clicking top level
  $('.learning-section-mobile-nav > a').click(function() {
    $(this).parent().children('ul.app-mobile-subnav-section').toggle();
  }); 

  //disable top level section click on mobile nav
  $('.learning-section-mobile-nav .top-level-link').click(function(e) {
    e.preventDefault();
  });

});
