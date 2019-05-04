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
    this.container = $(`#${id}`);
    this.button = this.container.find('.gallery-button');
    this.closeModal = this.container.find('.gallery-close');

    this.imageURLs = this.getImageURLs();

    this.openModalHandler();
    this.closeModalHandler();
  }

  getImageURLs() {
    return this.container.find('.gallery-modal-image').map((_, element) => {
      return $(element).data('image-url')
    }).get();
  }

  buildGallery() {
    if (this.imageURLs.length > 0) {
      this.container.find('img').attr('src', this.imageURLs[0]);
    }
  }

  openModalHandler() {
    this.button.click(event => {
      event.preventDefault();
      this.container.find('.gallery-modal').addClass('is-active');
    });

    this.buildGallery();
  }

  closeModalHandler() {
    this.closeModal.click(event => {
      this.container.find('.gallery-modal').removeClass('is-active');
    });
  }
}

class SlideShow {
  constructor(id) {
    this.container = $(`#${id}`);
    this.currentIndex = 0;
    this.imageURLs = this.getImageURLs();

    this.initialize();
    this.prev = this.container.find('.prev');
    this.next = this.container.find('.next');

    this.prevHandler();
    this.nextHandler();
  }

  getImageURLs() {
    return this.container.find('.slideshow-image').map((_, element) => {
      return $(element).data('image-url');
    }).get();
  }

  initialize() {
    if (this.imageURLs.length === 1) {
      this.container.append(`
        <div class='card-image'>
          <figure class='image is-4by3'>
            <img src='${this.imageURLs[this.currentIndex]}' />
          </figure>
        </div>
      `)
    } else if (this.imageURLs.length > 0) {
      this.container.append(`
        <div class='card-image'>
          <figure class='image is-4by3'>
            <img src='${this.imageURLs[this.currentIndex]}' />
          </figure>
          <i class="slideshow-chevron prev fa fa-2x fa-chevron-left"></i>
          <i class="slideshow-chevron next fa fa-2x fa-chevron-right"></i>
        </div>
      `)
    }
  }

  prevHandler() {
    this.prev.on('click', () => {
      if (this.currentIndex === 0) {
        this.currentIndex = this.imageURLs.length - 1
      } else {
        this.currentIndex--;
      }

      this.container.find('img').attr('src', this.imageURLs[this.currentIndex]);
    })
  }

  nextHandler() {
    this.next.on('click', () => {
      if (this.currentIndex === this.imageURLs.length - 1) {
        this.currentIndex = 0;
      } else {
        this.currentIndex++;
      }

      this.container.find('img').attr('src', this.imageURLs[this.currentIndex]);
    })
  }
}

$(document).ready(() => {
  new DrivingDirectionsModal();

  $('.slideshow').each((_, element) => {
    new SlideShow($(element).attr('id'));
  });

  $('.detector-location').each((_, element) => {
    new GalleryModal($(element).attr('id'));
  });
});
