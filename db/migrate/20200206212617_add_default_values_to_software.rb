class AddDefaultValuesToSoftware < ActiveRecord::Migration[6.0]
  def change
    change_column_default :softwares, :acceptable_call_quality, 0.80
    change_column_default :softwares, :sequence_decision_threshold, 0.90
    change_column_default :softwares, :max_no_calls, 16
  end
end
