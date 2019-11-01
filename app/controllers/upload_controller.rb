class UploadController < ApplicationController

  def index
  end

  def import_deployments
    data_file = params[:file]

    CSV.foreach(data_file.path, headers: true) do |row|
      Deployment.create(row.to_h)
    end

    redirect_to action: 'show'
  end

  def import_audio_analysis
  end

end
