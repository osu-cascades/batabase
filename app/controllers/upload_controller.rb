class UploadController < ApplicationController

  def index
  end

  def import_site_meta
    data_file = params[:file]
    data = CSV.read(data_file.path)
    byebug
  end

  def import_audio_analysis
  end
end
