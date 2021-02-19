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

  document.querySelectorAll('.nhsuk-card--clickable').forEach((panel) => {
    // Check if panel has a link within it
    if (panel.querySelector('a') !== null) {
      // Clicks the link within the heading to navigate to desired page
      panel.addEventListener('click', () => {
        panel.querySelector('a').click();
      });
    }
  });
  
});


