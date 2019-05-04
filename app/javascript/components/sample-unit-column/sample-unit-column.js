import "./sample-unit-column.scss";

class DrivingDirectionsModal {
  constructor(id) {
    this.container = $(`#${id}`);
    this.modal = this.container.find('.driving-modal');
    this.button = this.container.find('.driving-button');
    this.closeModal = this.container.find('.driving-close');
    this.openModalHandler();
    this.closeModalHandler();
  }

  openModalHandler() {
    this.button.click((event) => {
      this.modal.addClass('is-active');
    });
  }

  closeModalHandler() {
    this.closeModal.click((event) => {
      this.modal.removeClass('is-active');
    });
  }
}

class GalleryModal {
  constructor(id) {
    this.container = $(`#${id}`);
    this.button = this.container.find('.gallery-button');
    this.closeModal = this.container.find('.gallery-close');
    this.deletePhotoButton = this.container.find('.deletey-boi')

    this.imageURLs = this.getImageURLs();
    this.openModalHandler();
    this.closeModalHandler();
    this.deletePhotoHandler();
  }

  getImageURLs() {
    return this.container.find('.gallery-modal-image').map((_, element) => {
      return $(element).data('image-url')
    }).get();
  }

  buildGallery() {
    for (let i = 0; i < this.imageURLs.length; i++) {
      let id = "photo-" + i;
      this.container.find(id).attr('src', this.imageURLs[i]);
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
      console.log('ahh')
      this.container.find('.gallery-modal').removeClass('is-active');
    });
  }

  deletePhotoHandler(){
    this.deletePhotoButton.click(event => {

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
      this.container.find('.slideshow').append(`
        <div class='card-image'>
          <figure class='image is-4by3'>
            <img src='${this.imageURLs[this.currentIndex]}' />
          </figure>
        </div>
      `)
    } else if (this.imageURLs.length > 0) {
      this.container.find('.slideshow').append(`
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
  $('.detector-location').each((_, element) => {
    const id = $(element).attr('id');

    new SlideShow(id);
    new GalleryModal(id);
    new DrivingDirectionsModal(id);
  });
});
