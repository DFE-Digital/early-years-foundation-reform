import '@hotwired/turbo-rails';

import './controllers';
import './modules/in_page_links';

import { initAll } from 'govuk-frontend';

document.addEventListener('turbo:load', function () {
  initAll();
});

document.addEventListener('click', (event) => {
  if (
    event.target instanceof Element &&
    event.target.closest('[data-module="print-link"]')
  ) {
    window.print();
  }
});
