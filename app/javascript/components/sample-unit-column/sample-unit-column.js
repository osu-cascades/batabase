import "./sample-unit-column.scss";

class Modal {
  constructor() {
    this.modal = $(document).find('.modal');
    this.button = $(document).find('.modal-button');
    this.closeModal = $(document).find('.modal-close');
    this.openModalHandler();
    this.closeModalHandler();
  }

  openModalHandler() {
    this.button.click(event => {
      this.modal.addClass('is-active');
    });
  }

  closeModalHandler() {
    this.closeModal.click(event => {
      this.modal.removeClass('is-active');
    });
  }
}

$(document).ready(() => {
  new Modal();
});
