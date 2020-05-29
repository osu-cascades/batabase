# frozen_string_literal: true

class SonobatOutputsController < ApplicationController
  FIELDS = [:night, :filename, :hi_f, :lo_f, :spp_accp, :prob, :maj, :accp, :spp, :tilde_prob, :fc_mean, :fc_std_dev, :dur_mean, :dur_std_dev, :calls_per_sec, :mean_hi_freq, :mean_lo_freq, :mean_uppr_slp, :mean_lwr_slp, :mean_total_slp, :mean_preceding_intvl, :first, :second, :third, :fourth, :parent_dir, :next_dir_up, :file_length, :version, :filter, :accp_quality, :accp_qual_for_tally, :max_calls_considered, :manual_idspp1, :manual_idspp2, :notes].freeze
  HEADERS = [:night, :filename, :hi_f, :lo_f, :spp_accp, :prob, :maj, :accp, :spp, :tilde_prob, :fc_mean, :fc_std_dev, :dur_mean, :dur_std_dev, :calls_per_sec, :mean_hi_freq, :mean_lo_freq, :mean_uppr_slp, :mean_lwr_slp, :mean_total_slp, :mean_preceding_intvl, :first, :second, :third, :fourth, :parent_dir, :next_dir_up, :file_length, :version, :filter, :accp_quality, :accp_qual_for_tally, :max_calls_considered, :manual_idspp1, :manual_idspp2, :notes].freeze

  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @fields = FIELDS
    @headers = HEADERS
    @helpers = helpers
    @search = ransack_params
    @sonobat_outputs = ransack_result
  end

  def new
    @model = SonobatOutput.new
    @fields = fetch_form_fields
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
    @sonobat_output = SonobatOutput.find(params[:id])
    @model = @sonobat_output
    @fields = fetch_form_fields(@sonobat_output.deployment_id)
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

  def fetch_form_fields(deployment = 1)
    [
      { type: :select, name: :deployment_id, options: helpers.options_from_collection_for_select(Deployment.all, 'id', 'id', deployment) },
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
  end

  def invalid_foreign_key(exception)
    redirect_to sonobat_outputs_path, alert: "DELETE CANCELED: #{exception}"
  end

  def ransack_params
    SonobatOutput.ransack(params[:q])
  end

  def ransack_result
    @search.result.page(params[:page])
  end
end
