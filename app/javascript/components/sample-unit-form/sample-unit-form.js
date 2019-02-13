import "./sample-unit-form.scss";

class StateSelect {
  constructor() {
    this.stateSelect = $(document).find('.state-select');
    this.stateSelectListener();
  }

  stateSelectListener() {
    this.stateSelect.change((event) => {
      console.log(this.stateSelect.val());

      let url = `/api/${event.currentTarget.value}/counties?`;
      this.stateSelect.val().forEach((id) => {
        url += `state_ids[]=${id}&`
      })

      $.get(url, (data) => {
        this.replaceCountySelectOptions(data);
      });
    });
  }

  replaceCountySelectOptions(data) {
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
