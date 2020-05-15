# frozen_string_literal: true

class SonobatOutputsController < ApplicationController
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @sonobat_outputs_grid = SonobatOutputsGrid.new(params[:sonobat_outputs_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def new
    @model = SonobatOutput.new

    @fields = [
      { type: :select, name: :deployment_id, options: Deployment.all.pluck(:id) },
      { type: :date_select, name: :night, options: {} },
      { type: :text_field, name: :filename, options: {} },
      { type: :check_box, name: :hi_f, options: {} },
      { type: :check_box, name: :lo_f, options: {} },
      { type: :text_field, name: :spp_accp, options: {} },
      { type: :number_field, name: :prob, options: { step: 0.01 } },
      { type: :number_field, name: :maj, options: { step: 0.01 } },
      { type: :number_field, name: :accp, options: { step: 0.01 } },
      { type: :text_field, name: :spp, options: {} },
      { type: :text_field, name: :tilde_prob, options: {} },
      { type: :number_field, name: :fc_mean, options: { step: 0.01 } },
      { type: :number_field, name: :fc_std_dev, options: { step: 0.01 } },
      { type: :number_field, name: :dur_mean, options: { step: 0.01 } },
      { type: :number_field, name: :dur_std_dev, options: { step: 0.01 } },
      { type: :text_field, name: :calls_per_sec, options: {} },
      { type: :number_field, name: :mean_hi_freq, options: { step: 0.01 } },
      { type: :number_field, name: :mean_lo_freq, options: { step: 0.01 } },
      { type: :number_field, name: :mean_uppr_slp, options: { step: 0.01 } },
      { type: :number_field, name: :mean_lwr_slp, options: { step: 0.01 } },
      { type: :number_field, name: :mean_total_slp, options: { step: 0.01 } },
      { type: :number_field, name: :mean_preceding_intvl, options: { step: 0.01 } },
      { type: :text_field, name: :first, options: {} },
      { type: :text_field, name: :second, options: {} },
      { type: :text_field, name: :third, options: {} },
      { type: :text_field, name: :fourth, options: {} },
      { type: :text_field, name: :parent_dir, options: {} },
      { type: :text_field, name: :next_dir_up, options: {} },
      { type: :number_field, name: :file_length, options: { step: 0.01 } },
      { type: :number_field, name: :version, options: { step: 0.01 } },
      { type: :text_field, name: :filter, options: {} },
      { type: :number_field, name: :accp_quality, options: { step: 0.01 } },
      { type: :number_field, name: :accp_qual_for_tally, options: { step: 0.01 } },
      { type: :number_field, name: :max_calls_considered, options: { step: 0.01 } },
      { type: :text_field, name: :manual_idspp1, options: {} },
      { type: :text_field, name: :manual_idspp2, options: {} },
      { type: :text_field, name: :notes, options: {} }
    ]

    @header_text = 'Create Sonobat Output'
  end

  def create
    # TODO: permit these
    @sonobat_output = SonobatOutput.create(params[:sonobat_output].to_unsafe_h)

    if @sonobat_output.errors.any?
      redirect_to sonobat_outputs_path, alert: @sonobat_output.errors.messages
    else
      redirect_to sonobat_outputs_path, notice: 'Sonobat Output Successfully Added'
    end
  end

  def edit
    @model = SonobatOutput.find(params[:id])

    @fields = [
      { type: :select, name: :deployment_id, options: Deployment.all.pluck(:id) },
      { type: :date_select, name: :night, options: {} },
      { type: :text_field, name: :filename, options: {} },
      { type: :check_box, name: :hi_f, options: {} },
      { type: :check_box, name: :lo_f, options: {} },
      { type: :text_field, name: :spp_accp, options: {} },
      { type: :number_field, name: :prob, options: { step: 0.01 } },
      { type: :number_field, name: :maj, options: { step: 0.01 } },
      { type: :number_field, name: :accp, options: { step: 0.01 } },
      { type: :text_field, name: :spp, options: {} },
      { type: :text_field, name: :tilde_prob, options: {} },
      { type: :number_field, name: :fc_mean, options: { step: 0.01 } },
      { type: :number_field, name: :fc_std_dev, options: { step: 0.01 } },
      { type: :number_field, name: :dur_mean, options: { step: 0.01 } },
      { type: :number_field, name: :dur_std_dev, options: { step: 0.01 } },
      { type: :text_field, name: :calls_per_sec, options: {} },
      { type: :number_field, name: :mean_hi_freq, options: { step: 0.01 } },
      { type: :number_field, name: :mean_lo_freq, options: { step: 0.01 } },
      { type: :number_field, name: :mean_uppr_slp, options: { step: 0.01 } },
      { type: :number_field, name: :mean_lwr_slp, options: { step: 0.01 } },
      { type: :number_field, name: :mean_total_slp, options: { step: 0.01 } },
      { type: :number_field, name: :mean_preceding_intvl, options: { step: 0.01 } },
      { type: :text_field, name: :first, options: {} },
      { type: :text_field, name: :second, options: {} },
      { type: :text_field, name: :third, options: {} },
      { type: :text_field, name: :fourth, options: {} },
      { type: :text_field, name: :parent_dir, options: {} },
      { type: :text_field, name: :next_dir_up, options: {} },
      { type: :number_field, name: :file_length, options: { step: 0.01 } },
      { type: :number_field, name: :version, options: { step: 0.01 } },
      { type: :text_field, name: :filter, options: {} },
      { type: :number_field, name: :accp_quality, options: { step: 0.01 } },
      { type: :number_field, name: :accp_qual_for_tally, options: { step: 0.01 } },
      { type: :number_field, name: :max_calls_considered, options: { step: 0.01 } },
      { type: :text_field, name: :manual_idspp1, options: {} },
      { type: :text_field, name: :manual_idspp2, options: {} },
      { type: :text_field, name: :notes, options: {} }
    ]

    @header_text = 'Update Sonobat Output'
  end

  def update
    # TODO: permit these
    update_success = SonobatOutput.find(params[:id]).update(params[:sonobat_output].to_unsafe_h)

    if !update_success
      redirect_to sonobat_outputs_path, alert: 'Sonobat Output Failed to Update'
    else
      redirect_to sonobat_outputs_path, notice: 'Sonobat Output Successfully Updated'
    end
  end

  def destroy
    SonobatOutput.destroy(params[:id])
    redirect_to sonobat_outputs_path, notice: 'Sonobat Output Successfully Deleted'
  end

  def export
    @sonobat_outputs = SonobatOutput.all
    respond_to do |format|
      format.xlsx do
        response.headers[
          'Content-Disposition'
        ] = 'attachment; filename=sonobat_outputs.xlsx'
      end
      format.html { render :index }
    end
  end

  private

  def invalid_foreign_key(exception)
    redirect_to sonobat_outputs_path, alert: "DELETE CANCELED: #{exception}"
  end
end
