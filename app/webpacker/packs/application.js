require.context('govuk-frontend/govuk/assets');

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

  //mobile nav
  $( ".govuk-js-header-toggle" ).click(function() {
    $( ".app-subnav--mobile" ).toggle();
  });

  $('.learning-section-mobile-nav > a').click(function() {
    $(this).parent().children('ul.app-mobile-subnav-section').toggle();
  }); 

  $('.learning-section-mobile-nav .top-level-link').click(function(e) {
    e.preventDefault();
  });
  

});
