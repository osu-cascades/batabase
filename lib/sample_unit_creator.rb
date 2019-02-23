class SampleUnitCreator
  def initialize
    csv_text = CSV.foreach(File.expand_path('./lib/SampleUnit.csv'), headers: true) do |row|
      sample_unit = SampleUnit.find_by(site_code: row['SampleUnit'])

      if sample_unit.nil?
        create_sample_unit(row)
        next
      end

      update_sample_unit_state(sample_unit, row)
    end
  end

  private

  def create_sample_unit(row)
    broad_habitat_form_id = nil
    if row['BroadHabitat_Form'] != '0'
      broad_habitat_form_id = BroadHabitatForm.find_by(label: row['BroadHabitat_Form']).try(:id)
    end

    new_sample_unit = SampleUnit.create!(site_code: row['SampleUnit'], grts: row['GRTS'], broad_habitat_form_id: broad_habitat_form_id)

    create_sample_unit_states(new_sample_unit, row)
    create_sample_unit_counties(new_sample_unit, row)
  end

  def update_sample_unit_state(sample_unit, row)
    sample_unit.update_attributes(grts: row['GRTS'])
    create_sample_unit_states(sample_unit, row)
    create_sample_unit_counties(sample_unit, row)
  end

  def create_sample_unit_states(sample_unit, row)
    states = [
      { name: row['State1'], percentage: row['State1_Percent'] },
      { name: row['State2'], percentage: row['State2_Percent'] },
      { name: row['State3'], percentage: row['State3_Percent'] }
    ]

    states.each do |state|
      next if state.fetch(:name) == 'NA'

      state_model = State.find_by(state_name: state.fetch(:name))

      sample_unit_state = SampleUnitState.new(
        sample_unit_id: sample_unit.id,
        state_id: state_model.id,
        percentage: state.fetch(:percentage)
      )

      sample_unit_state.save!

      sample_unit.sample_unit_states << sample_unit_state
    end
  end

  def create_sample_unit_counties(sample_unit, row)
    counties = [
      { name: row['State_County1'], percentage: row['State_County1_Percent'] },
      { name: row['State_County2'], percentage: row['State_County2_Percent'] },
      { name: row['State_County3'], percentage: row['State_County3_Percent'] },
      { name: row['State_County4'], percentage: row['State_County4_Percent'] }
    ]

    counties.each do |county|
      name, state, percentage = county.values_at(:name, :state, :percentage)

      next if name == 'NA'

      county_model = get_county(name)

      if county_model.nil?
        puts "Error: county does not exist: #{name}"
        next
      end

      sample_unit_county = SampleUnitCounty.new(
        sample_unit_id: sample_unit.id,
        county_id: county_model.id,
        percentage: percentage
      )

      sample_unit_county.save!

      sample_unit.sample_unit_counties << sample_unit_county
    end
  end

  def get_county(name)
    state_county = name.split('_')
    state = state_county[0]
    county = state_county[1] + ' County'
    # Counties names are not unique
    # ex: Oregon & Ohio have a 'Morrow County'
    state_model = State.find_by(state_name: state)

    if state_model.nil?
      puts "Error: state does not exist: #{state}"
      return nil
    end

    County.where(name: county, state_id: state_model.id).first
  end
end
