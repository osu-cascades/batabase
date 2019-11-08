export default {
  stateMarkup:
    `<div class="field">
    <label class="label" for="sample_unit_State">State</label>
    <div class="control select">
      <select class="state-select" name="sample_unit[state_ids]" id="sample_unit_state_ids"><option value="1">Alaska</option>
        <option value="2">Alabama</option>
        <option value="3">Arkansas</option>
        <option value="4">Arizona</option>
        <option value="5">California</option>
        <option value="6">Colorado</option>
        <option value="7">Connecticut</option>
        <option value="8">Delaware</option>
        <option value="9">Florida</option>
        <option value="10">Georgia</option>
        <option value="11">Hawaii</option>
        <option value="12">Iowa</option>
        <option value="13">Idaho</option>
        <option value="14">Illinois</option>
        <option value="15">Indiana</option>
        <option value="16">Kansas</option>
        <option value="17">Kentucky</option>
        <option value="18">Louisiana</option>
        <option value="19">Massachusetts</option>
        <option value="20">Maryland</option>
        <option value="21">Maine</option>
        <option value="22">Michigan</option>
        <option value="23">Minnesota</option>
        <option value="24">Missouri</option>
        <option value="25">Mississippi</option>
        <option value="26">Montana</option>
        <option value="27">North Carolina</option>
        <option value="28">North Dakota</option>
        <option value="29">Nebraska</option>
        <option value="30">New Hampshire</option>
        <option value="31">New Jersey</option>
        <option value="32">New Mexico</option>
        <option value="33">Nevada</option>
        <option value="34">New York</option>
        <option value="35">Ohio</option>
        <option value="36">Oklahoma</option>
        <option selected="selected" value="37">Oregon</option>
        <option value="38">Pennsylvania</option>
        <option value="39">Rhode Island</option>
        <option value="40">South Carolina</option>
        <option value="41">South Dakota</option>
        <option value="42">Tennessee</option>
        <option value="43">Texas</option>
        <option value="44">Utah</option>
        <option value="45">Virginia</option>
        <option value="46">Vermont</option>
        <option value="47">Washington</option>
        <option value="48">Wisconsin</option>
        <option value="49">West Virginia</option>
        <option value="50">Wyoming</option>
      </select>
    </div>
  </div>`
  ,
  countyMarkup : 
  (id)=> `<div class="field${id}">
    <label class="label" for="sample_unit_County">County</label>
    <div class="control select">
      <select class="county-select${id}" name="sample_unit[county_ids]" id="sample_unit_county_ids">
      </select>
    </div>
  </div>`
}
