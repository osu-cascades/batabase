import "./sample-unit-form.scss";
import Markup from '../state-county-select/state-county-select-markup';


class StateSelect {
  constructor() {
    this.stateSelect = $(document).find('.state-select');
    this.addStateCountyButton = $(document).find('.add-state-county');
    this.stateSelectListener();
    this.addStateCountyListener();
    this.totalCalls = 0
  }

  addStateCountyListener() {
    this.addStateCountyButton.click(event => {
      event.preventDefault();
      const target = event.currentTarget;
      $(target).after(Markup.stateMarkup);
    });
  }

  stateSelectListener() {
    this.stateSelect.change((event) => {
      const url = `/api/${event.currentTarget.value}/counties`;
      const target = event.currentTarget
      $.get(url, (data) => {
        this.buildCountySelectOptions(data,target);
      });
    });
  }

  buildCountySelectOptions(data, target) {
    const countiesSelect = Markup.countyMarkup(this.totalCalls);
    let countydie= $(document).find(`.county-select${this.totalCalls}`)

    let countyboi = $(target).parent().parent().after(countiesSelect)
    let countySelect = $(document).find(`.county-select${this.totalCalls}`)
    this.totalCalls += 1;

    data.forEach((county) => {
      //console.log( county )
      const option = $("<option></option>").attr("value", county.id).text(county.name)
      countySelect.append(option)
    })
  }
}

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
      console.log($(element).text());
    });
  }
}

$(document).ready(() => {
  // const stateSelect = new StateSelect();
  const dynamicForm = new DynamicForm();
});
