import "./sample-unit-form.scss";

class StateSelect {
  constructor() {
    this.stateSelect = $(document).find('.state-select');
    this.stateSelectListener();
  }

  stateSelectListener() {
    this.stateSelect.change((event) => {
      let url = `/api/${event.currentTarget.value}/counties`;

      $.get(url, (data) => {
        this.replaceCountySelectOptions(data);
      });
    });
  }

  replaceCountySelectOptions(data) {
    console.log(data);
    let countySelect = $(document).find('.county-select');
    countySelect.empty();

    data.forEach((county) => {
      const option = $("<option></option>").attr("value", county.id).text(county.name)
      countySelect.append(option)
    })
  }
}

$(document).ready(() => {
  const stateSelect = new StateSelect();
});
