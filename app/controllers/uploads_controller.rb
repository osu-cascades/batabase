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
    upload_data = params[:game][:data]
    @upload = Upload.create(
      data: upload_data,
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
