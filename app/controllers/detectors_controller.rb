class DetectorsController < ApplicationController
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @detectors_grid = DetectorsGrid.new(params[:detectors_grid])
  end

  def new
    @detector = Detector.new
  end

  def create
    detector_firmware = params[:detector][:firmware]
    detector_manufacturer = params[:detector][:manufacturer]
    detector_model = params[:detector][:model]
    detector_serial_number = params[:detector][:serial_number]
    detector_owners_organization_name = params[:detector][:organization]

    detectors_organization = Organization.find_by(name: detector_owners_organization_name)

    if detectors_organization.nil?
      detectors_organization = Organization.find_by(name: "Other")
    end

    @detector = Detector.create!(
      firmware: detector_firmware,
      manufacturer: detector_manufacturer,
      model: detector_model,
      serial_number: detector_serial_number,
      organization_id: detectors_organization.id
    )

    if @detector.errors.any?
      render(:new)
      return
    end
    
    redirect_to detectors_path
    return
  end

  def destroy
    @detector = Detector.destroy(params[:id])
    redirect_to detectors_path
    return
  end

  private

  def invalid_foreign_key
    redirect_to detectors_path, alert: 'DELETE CANCELED: The detector selected still has deployments associated with it.'
    return
  end
end
