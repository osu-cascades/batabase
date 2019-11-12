class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
  end

  def create
    upload_data = params[:upload][:data]
    file_name = upload_data.original_filename
    upload_type = params[:upload][:upload_type]

    byebug
    @upload = Upload.create(
      file_name: file_name,
      data: upload_data,
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
