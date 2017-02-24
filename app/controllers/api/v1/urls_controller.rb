class Api::V1::UrlsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # respond_to :json

  def index
    urls = Url.all
    render json: urls.as_json(include:[:h1_tags, :h2_tags, :h3_tags, :internal_links])
  end

  def show
    url = Url.find_by(id: params[:id])
    render json: url.as_json(include:[:h1_tags, :h2_tags, :h3_tags, :internal_links])
  end

  def create
    url = Url.new(url_params)
    if url.save
      render json: {
        status: 200,
        message: "Success!",
        url: url
      }.to_json
    else
      render json: {
        status: 500,
        errors: url.errors
      }.to_json
    end
  end

  def destroy 
    url = Url.find(params[:id])
    url.destroy
    render json: {
    status: 200,
    message: "Successfully deleted."
    }.to_json
  end

  private

  def url_params
    params.require(:url).permit(:name)
  end
  
end
