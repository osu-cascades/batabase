class DynamicForm {
  constructor() {
    this.addFieldsListener();
    this.removeFieldsListener();
    this.removeImagesListener();
    this.labelHeaderIndexes();
  }

  addFieldsListener() {
    $('form').on('click', '.add_fields', (event) => {
      const target = $(event.currentTarget);
      const time = new Date().getTime();
      const regexp = new RegExp(target.data('id'), 'g');
      target.before(target.data('fields').replace(regexp, time));
      this.labelHeaderIndexes();
      event.preventDefault();
    });
  }
  removeImagesListener() {
    $('form').on('click', '.remove_image', (event) => {
      const target = $(event.currentTarget);
      target.prev('input[type=hidden]').val('1');
      target.closest('.fieldset').hide();
      event.preventDefault();
    });
  }

  removeFieldsListener() {
    $('form').on('click', '.remove_fields', (event) => {
      const target = $(event.currentTarget);
      target.prev('input[type=hidden]').val('1');
      target.closest('.fieldset').hide();
      event.preventDefault();
    });
  }

  labelHeaderIndexes() {
    $('.detector-location-index').each((i, element) => {
      $(element).text(`Location ${i+1}`);
    });
  }
}

$(document).ready(() => {
  // const stateSelect = new StateSelect();
  const dynamicForm = new DynamicForm();
});
