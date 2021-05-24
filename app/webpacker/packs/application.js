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

  //----- mobile nav -----//

  //clipboard
  $('#clipboard_copier').click(function() {
    copyToClipboard();
  });

  document.querySelectorAll('.eyfs-card--clickable').forEach((panel) => {
    // Check if panel has a link within it
    if (panel.querySelector('a') !== null) {
      // Clicks the link within the heading to navigate to desired page
      panel.addEventListener('click', () => {
        panel.querySelector('a').click();
      });
    }
  });

});

const menuButton = document.querySelector('.js-app-mobile-nav-toggler');

// The menu button is not rendered on the landing page
if (menuButton) {
  //Set aria attributes when JS is available
  menuButton.setAttribute('aria-expanded', 'false');
  menuButton.addEventListener('click', function() {
    //Menu open
    if (menuButton.classList.contains('is-active')) {
      menuButton.classList.add('is-active');
      mobileSubNav.classList.add('app-mobile-nav--active');
      menuButton.setAttribute('aria-expanded', 'false')
      mobileSubNav.setAttribute('aria-hidden', 'true')
    } else { //menu closed//
      menuButton.classList.remove('is-active');
      mobileSubNav.classList.remove('app-mobile-nav--active');
      menuButton.setAttribute('aria-expanded', 'true')
      mobileSubNav.setAttribute('aria-hidden', 'false')
    }
  });
}

const mobileSubNav = document.querySelector('.app-subnav--mobile');
// Not present on the landing page
if (mobileSubNav) {
  mobileSubNav.setAttribute('aria-hidden', 'true');
}

// // Sub navigation

// // Loop through and find all the sub headings
const subLinks = document.querySelectorAll('.app-mobile-nav-subnav-toggler');
const subNavActive = ('app-mobile-nav__subnav--active');

// build an array of the subLinks
Array.from(subLinks).forEach(link => {

  // listen for a click on subLinks
  link.addEventListener('click', function(e) {
    //rules for aria attributes when submenu is closed
    e.preventDefault();
    if (this.nextElementSibling.classList.contains(subNavActive)) {
      this.nextElementSibling.classList.remove(subNavActive)
      this.firstElementChild.setAttribute('aria-expanded', 'false')
      this.nextElementSibling.setAttribute('aria-hidden', 'true')
    //rules for aria attributes when submenu is open
    } else {
      this.nextElementSibling.classList.add(subNavActive)
      this.firstElementChild.setAttribute('aria-expanded', 'true')
      this.nextElementSibling.setAttribute('aria-hidden', 'false')
    }
  });
});

const stickyMenu = document.querySelector('.js-app-mobile-nav-toggler');
const mobileStickySubNav = document.querySelector('.app-subnav--mobile');

// Not present on the landing page
if (stickyMenu) {
  stickyMenu.onclick = () => {
    stickyMenu.classList.toggle('is-active');
    mobileStickySubNav.classList.toggle('app-mobile-nav--active');
  }
}
