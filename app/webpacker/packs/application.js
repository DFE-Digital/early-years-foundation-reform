require.context('govuk-frontend/govuk/assets');

import '../styles/application.scss';
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import { initAll } from 'govuk-frontend';

import {createPreview} from "custom/admin";

Rails.start();
Turbolinks.start();
initAll();

createPreview('content_page_markdown', 'markdown-render');

