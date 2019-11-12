class UploadsController < ApplicationController
  require 'csv'

  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
    @upload_csv = CSV.parse(@upload.data)
    
  end

  def new
    @upload = Upload.new
  end

  def create
    upload_data = params[:upload][:data]
    csv_string = File.read(upload_data.path)

    filename = upload_data.original_filename
    upload_type = params[:upload][:upload_type]

    @upload = Upload.create(
      filename: filename,
      data: csv_string,
      upload_type: upload_type
    )

    if @upload.errors.any?
      render(:new)
      return
    end

    redirect_to action: 'show', id: @upload.id
  end

  def destroy
    Upload.find(params[:id]).destroy

    redirect_to uploads_path
  end
end
