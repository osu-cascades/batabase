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
  constructor(id) {
    this.container = $(`#gallery${id}`);
    this.button = $(document).find('.gallery-button');
    this.closeModal = $(document).find('.gallery-close');
    this.imageURLs = this.getImageURLs();
    this.buildGallery();
    this.openModalHandler();
    this.closeModalHandler();
  }

  openModalHandler() {
    this.button.click(event => {
      event.preventDefault();
      this.container.addClass('is-active');
    });
  }
  getImageURLs() {
    return $(`#gallery${this.id}`).find('.gallery-modal-image').map(function() {
      return $(this).data('image-url')
    }).get()
  }
  buildGallery() {
    this.container.find('.gallery-figure').append(`<img src='${this.imageURLs[0]}' />`)
  }
  closeModalHandler() {
    this.closeModal.click(event => {
      this.container.removeClass('is-active');
    });
  }
}

class SlideShow {
  constructor(id) {
    this.container = $(`#${id}`);
    this.currentIndex = 0;
    this.imageURLs = this.getImageURLs();
    this.initialize();
  }

  getImageURLs() {
    return this.container.find('.gallery-image').map((_, element) => {
      return $(element).data('image-url')
    }).get();
  }

  initialize() {
    if (this.imageURLs.length > 0) {
      this.container.find('img').attr('src', this.imageURLs[this.currentIndex]);
    }
  }
}

$(document).ready(() => {
  new DrivingDirectionsModal();
  new GalleryModal();

  $('.slideshow').each((_, element) => {
    new SlideShow($(element).attr('id'));
  });

  $('.gallery-modal').each((_, element) => {
    new GalleryModal($(element).attr('id'));
  });
});
