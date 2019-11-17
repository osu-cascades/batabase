class UploadsController < ApplicationController
  require 'csv'

  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
    @upload_filename = @upload.filename
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
      data: csv_string,
      filename: filename,
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

  def commit
    upload = Upload.find(params[:upload_id])
    # This will be where the work happens for turning
    # the CSV into tables in db
    redirect_to uploads_path
  end
end
