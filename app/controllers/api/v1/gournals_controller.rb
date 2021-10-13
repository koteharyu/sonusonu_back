class Api::V1::GournalsController < ApplicationController

  def index
    gournals = Gournal.order(created_at: :desc)
    render json: gournals, methods: [:image_url, :author_image_url]
  end

  def create
    gournal = Gournal.new(gournal_params)
    if gournal.save
      render json: gournal, methods: [:image_url, :author_image_url]
    else
      render json: gournal.errors
    end
  end

  private

  def gournal_params
    params.require(:gournal).permit(:title, :content, :image, :author_image)
  end
end
