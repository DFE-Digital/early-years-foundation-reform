import '@hotwired/turbo-rails';

import './controllers';
import './modules/in_page_links';

import { initAll } from 'govuk-frontend';

const initialisedBodies = new WeakSet();

function initialiseGovukFrontend() {
  const body = document.body;
  if (initialisedBodies.has(body)) return;

  body.classList.add('js-enabled', 'govuk-frontend-supported');
  initAll();
  initialisedBodies.add(body);
}

document.addEventListener('turbo:load', initialiseGovukFrontend);
document.addEventListener('turbo:render', initialiseGovukFrontend);

document.addEventListener('click', (event) => {
  if (
    event.target instanceof Element &&
    event.target.closest('[data-module="print-link"]')
  ) {
    window.print();
  }
});
