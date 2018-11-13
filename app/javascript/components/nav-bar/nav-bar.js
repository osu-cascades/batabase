import './nav-bar.scss';

class HamburgerMenu {
  constructor() {
    this.burgerListener();
  }

  burgerListener() {
    $('.navbar-burger').click(() => {
      $('.navbar-burger').toggleClass('is-active');
      $('.navbar-menu').toggleClass('is-active');
    });
  }
}

$(document).ready(() => {
  const hamburgerMenu = new HamburgerMenu();
});
