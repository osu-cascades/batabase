# frozen_string_literal: true

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
    @upload = Upload.new
  end

  def create
    upload_type = params[:upload][:upload_type]
    upload_data = params[:upload][:data]

    data = ''

    if upload_data.content_type == 'text/csv'
      CSV.read(upload_data.path).each { |line| data += CSV.generate_line(line) }
    else
      CSV.read(upload_data.path, col_sep: "\t").each { |line| data += CSV.generate_line(line) }
    end

    @upload = Upload.create(
      data: data,
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

    workflow = CommitUpload.new(CSV.parse(upload.data, headers: true), upload.upload_type)
    workflow.run

    redirect_to uploads_path
  end
end
