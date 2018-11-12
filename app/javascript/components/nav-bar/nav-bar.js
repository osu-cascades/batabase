import './nav-bar.scss';

class HamburgerMenu {
  constructor() {
    this.burgers = this.getBurgers();
    if (this.burgers.length > 0) {
      this.burgerListener();
    }
  }

  getBurgers() {
    return Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
  }

  burgerListener(burgers) {
    this.burgers.forEach(patty => {
      patty.addEventListener('click', () => {
        const target = document.getElementById(patty.dataset.target);
        patty.classList.toggle('is-active');
        target.classList.toggle('is-active');
      });
    });
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const hamburgerMenu = new HamburgerMenu();
});
