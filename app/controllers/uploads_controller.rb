class UploadsController < ApplicationController
  require 'csv'

  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
    @upload_csv = CSV.parse(@upload.data)
    @upload_filename = @upload.filename
  end

  def new
    if params[:empty_file] == "true"
      @empty_file = true
    else
      @empty_file = false
    end

    @upload = Upload.new
  end

  def create
    upload_type = params[:upload][:upload_type]
    upload_data = params[:upload][:data]

    string_data = File.read(upload_data.path)
    if string_data.empty?
      redirect_to action: 'new', empty_file: true
      return
    end

    @upload = Upload.create(
      data: string_data,
      filename: upload_data.original_filename,
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
