import "./index-nested-table.scss";

class NestedTable {
  constructor() {
    this.cheronDown = '<i class="fas fa-chevron-down"></i>';
    this.cheronRight = '<i class="fas fa-chevron-right"></i>';
    this.container = $(document).find('.nested-table');
    this.activateFirstRow();
    this.toggleRowListener();
  }

  activateFirstRow() {
    let firstRow = this.container.find('.parent-row').first();
    let indexOfCurrentTarget = $('.parent-row').index(firstRow);
    let targetRows = this.container.find(`.sub-row-${indexOfCurrentTarget}`);
    firstRow.addClass('active');
    firstRow.find('.fas').remove();
    firstRow.find('.chevron').append(this.cheronDown);
    this.container.find(targetRows).slideDown(300).addClass('open');
  }

  toggleRowListener() {
    $('.parent-row').click((e) => {
      let { target, indexOfCurrentTarget, nestedRows } = this.getElements(e);

      if (target.is('.active')) {
        this.removeActiveStatus(target, nestedRows);
      } else {
        this.addActiveStatus(target, nestedRows);
      }
    });
  }

  getElements(e) {
    let target = $(e.currentTarget);
    let indexOfCurrentTarget = $('.parent-row').index(target);
    let nestedRows = this.container.find(`.sub-row-${indexOfCurrentTarget}`);
    return { target, indexOfCurrentTarget, nestedRows };
  }

  removeActiveStatus(target, nestedRows) {
    target.removeClass('active');
    target.find('.fas').remove();
    target.find('.chevron').append(this.cheronRight);
    this.container.find(nestedRows).slideUp(300).removeClass('open');
  }

  addActiveStatus(target, nestedRows) {
    target.addClass('active');
    target.find('.fas').remove();
    target.find('.chevron').append(this.cheronDown);
    this.container.find(nestedRows).slideDown(300).addClass('open');
  }
}

$(document).ready(() => {
  const nestedTable = new NestedTable();
});
