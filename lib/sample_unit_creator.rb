class SampleUnitCreator
  def initialize
    # csv_text = CSV.foreach(File.expand_path('./lib/SampleUnit.csv'), headers: true) do |row|
    csv_text = CSV.foreach(File.expand_path('./lib/sample_unit_test.csv'), headers: true) do |row|
      sample_unit = SampleUnit.find_by(site_code: row['SampleUnit'])

      if sample_unit.nil? # Sample Unit does not exist, create new one
        next
      end

      update_sample_unit_state(sample_unit, row)
    end
  end

  private

  def update_sample_unit_state(sample_unit, row)
    sample_unit.update_attributes(grts: row['GRTS'])
    create_sample_unit_states(sample_unit, row)
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
end
