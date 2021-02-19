require.context('govuk-frontend/govuk/assets');
require.context('../images', true)

import '../styles/application.scss';
import Rails from 'rails-ujs';
import { initAll } from 'govuk-frontend';
import $ from 'jquery';
import {createPreview, copyToClipboard} from "custom/admin";

Rails.start();
initAll();

$(document).ready(function() {

  $('#markdown-editor').keyup(function() {
    createPreview('#markdown-editor','#markdown-render');
  });

  //clipboard
  $('#clipboard_copier').click(function() {
    copyToClipboard();
  });
  
});