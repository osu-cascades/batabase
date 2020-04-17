class DetectorsController < ApplicationController
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @detectors_grid = DetectorsGrid.new(params[:detectors_grid])
  end

  def new
    @detector = Detector.new
    @model = @detector
    @fields = [
      :firmware,
      :manufacturer,
      :model,
      :serial_number,
      :organization
    ]

    @header_text = "Create Detector"
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

    @detector = Detector.create(
      firmware: detector_firmware,
      manufacturer: detector_manufacturer,
      model: detector_model,
      serial_number: detector_serial_number,
      organization_id: detectors_organization.id
    )

    if @detector.errors.any?
      redirect_to detectors_path, alert: @detector.errors.messages
      return
    end
    
    redirect_to detectors_path, notice: 'Detector Successfuly Added'
    return
  end

  def edit
    @detector = Detector.find(params[:id])
    @model = @detector
    @fields = [
      :firmware,
      :manufacturer,
      :model,
      :serial_number,
      :owner
    ]

    @header_text = "Update Detector"
  end

  def update
    detector_firmware = params[:detector][:firmware]
    detector_manufacturer = params[:detector][:manufacturer]
    detector_model = params[:detector][:model]
    detector_serial_number = params[:detector][:serial_number]
    detector_owners_organization_name = params[:detector][:owner]



    detector_to_update = Detector.find(params[:id])

    owning_organization = Organization.find_by(name: detector_owners_organization_name)

    if owning_organization.nil?
      owning_organization = Organization.find_by(name: "Other")
    end

    detector_to_update.update(
      firmware: detector_firmware,
      manufacturer: detector_manufacturer,
      model: detector_model,
      serial_number: detector_serial_number,
      organization_id: owning_organization.id
    )

    if detector_to_update.errors.any?
      redirect_to detectors_path, alert: detector_to_update.errors.messages
      return
    end

    redirect_to detectors_path, notice: 'Detector Successfully Updated'
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
