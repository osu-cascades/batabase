import "./sample-unit-column.scss";

class DrivingDirectionsModal {
  constructor() {
    this.modal = $(document).find('.driving-modal');
    this.button = $(document).find('.driving-button');
    this.closeModal = $(document).find('.driving-close');
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
class GalleryModal {
  constructor() {
    this.modal = $(document).find('.gallery-modal');
    this.button = $(document).find('.gallery-button');
    this.closeModal = $(document).find('.gallery-close');
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

class SlideShow {
  constructor(id) {
    this.id = id;
    this.images = this.getImages();
  }

  getImageURLs() {
    return $(`#${this.id}`).find('.gallery-image').map(function() {
      return $(this).data('image-url')
    }).get()
  }
}

$(document).ready(() => {
  new DrivingDirectionsModal();
  new GalleryModal();

  $('.slideshow').each((_, element) => {
    new SlideShow($(element).attr('id'));
  })
});
