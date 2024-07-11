import '@hotwired/turbo-rails';

import './controllers';

import { initAll } from 'govuk-frontend';

document.addEventListener('turbo:load', function() {
  initAll();
})
