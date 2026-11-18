import '@hotwired/turbo-rails';

import './controllers';
import './modules/in_page_links';

import { initAll } from 'govuk-frontend';

document.addEventListener('turbo:load', function() {
  initAll();
})
