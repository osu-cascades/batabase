import './nav-bar.scss';

class HamburgerMenu {
  constructor() {
    this.burgerListener();
    this.subDropDownListener();
  }

  burgerListener() {
    $('.navbar-burger').click(() => {
      $('.navbar-burger').toggleClass('is-active');
      $('.navbar-menu').toggleClass('is-active');
    });
  }

  subDropDownListener() {
    $('.navbar-link').click((event) => {
      const target = $(event.currentTarget);
      if (target.hasClass('is-active')) {
        // target.find($('.navbar-dropdown')).hide();
        target.nextAll(".navbar-dropdown:first").hide();
        target.removeClass('is-active');
      } else {
        // target.find($('.navbar-dropdown')).show();
        target.nextAll(".navbar-dropdown:first").show();
        target.addClass('is-active');
      }
    });
  }
}

$(document).ready(() => {
  const hamburgerMenu = new HamburgerMenu();
});
