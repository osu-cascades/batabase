require "rails_helper"

RSpec.describe SampleUnit, type: :model do
  let(:sample_unit) { FactoryBot.build_stubbed(:sample_unit) }
  let(:sample_unit_with_sample_unit_states) { FactoryBot.build_stubbed(:sample_unit, :has_multiple_sample_unit_states) }
  let(:sample_unit_with_sample_unit_counties) { FactoryBot.build_stubbed(:sample_unit, :has_multiple_sample_unit_counties) }
  let(:sample_unit_with_habitat) { FactoryBot.build_stubbed(:sample_unit, :has_broad_habitat_information) }


  describe "Sample Unit Validation" do
    context "An sample unit is valid if" do
      it "It has an agency with a length below 50 characters" do
        valid_agency_of_48_characters = "FAKE" * 12
        sample_unit.agency = valid_agency_of_48_characters

        expect(sample_unit).to be_valid
      end

      it "It has a grts that is an integer" do
        sample_unit.grts = 42

        expect(sample_unit).to be_valid
      end
    end

    context "An sample unit is invalid if" do
      it "It has an agency with a length above 50 characters" do
        invalid_agency_of_52_characters = "FAKE" * 13
        sample_unit.agency = invalid_agency_of_52_characters

        expect(sample_unit).to_not be_valid
      end

      it "It has a grts that is not an integer" do
        sample_unit.grts = 4.2

        expect(sample_unit).to_not be_valid

        sample_unit.grts = "INVALID"

        expect(sample_unit).to_not be_valid
      end
    end
  end

  describe "Sample Unit Functionality" do
    context "State Interactions" do
      it 'A sample unit can return which state it primarily consists of' do
        primary_state = sample_unit_with_sample_unit_states.primary_state
        expect(primary_state.percentage).to eq(0.2)
      end

      it 'A sample unit can return the name of the state it primarily consists of' do
        # TODO: Make this better
        state = create(:state, id: 1)

        expect(sample_unit_with_sample_unit_states.primary_state_name).to eq("FAKE NAME")
      end

      it 'A sample unit can return the abbreviation of the state it primarily consists of' do
        expect(sample_unit_with_sample_unit_states.primary_state_percentage).to eq(0.2)
      end

      it 'A sample unit can return the percentage of the state it primarily consists of' do
        # TODO: Make this better
        state = create(:state, id: 1)

        expect(sample_unit_with_sample_unit_states.primary_state_name).to eq("FAKE NAME")
      end

      it 'A sample unit can return an array of states it consists of' do
        pending("TODO: this")
        expect(true).to be(false)
      end

      it 'A sample unit can return an array of sample unit states associated with it' do
        expect(sample_unit_with_sample_unit_states.sample_unit_states.size).to eq(3)
      end
    end

    context "County Interactions" do
      it 'A sample unit can return which county it primarily consists of' do
        primary_county = sample_unit_with_sample_unit_counties.primary_county
        expect(primary_county.percentage).to eq(0.2)
      end

      it 'A sample unit can return the name of the county it primarily consists of' do
        # TODO: Make this better
        state = create(:state, id: 1)
        county = create(:county, state_id: 1, id: 1)

        expect(sample_unit_with_sample_unit_counties.primary_county_name).to eq("FAKE NAME")
      end

      it 'A sample unit can return the abbreviation of the county it primarily consists of' do
        expect(sample_unit_with_sample_unit_counties.primary_county_percentage).to eq(0.2)
      end

      it 'A sample unit can return an array of counties it consists of' do
        pending("TODO: this")
        expect(true).to be(false)
      end

      it 'A sample unit can return an array of sample unit counties associated with it' do
        expect(sample_unit_with_sample_unit_counties.sample_unit_counties.size).to eq(3)
      end
    end

    context "Broad Habitat Interactions" do
      it "A sample unit can return its associated broad habitat if it exists" do
        expect(sample_unit_with_habitat.broad_habitat.class).to be(BroadHabitat)
      end

      it "A sample unit returns nil if its associated broad habitat does not exist" do
        expect(sample_unit.broad_habitat).to be_nil
      end

      it "A sample unit can return its associated broad habitat's label" do
        expect(sample_unit_with_habitat.broad_habitat_label).to eq("FAKE LABEL")
      end

      it "A sample unit can return its associated broad habitat form if it exists" do
        expect(sample_unit_with_habitat.broad_habitat_form.class).to be(BroadHabitatForm)
      end

      it "A sample unit returns nil if its associated broad habitat form does not exist" do
        expect(sample_unit.broad_habitat_form).to be_nil
      end

      it "A sample unit can return its associated broad habitat form's label" do
        expect(sample_unit_with_habitat.broad_habitat_form_label).to eq("FAKE LABEL")
      end
    end
  end

end