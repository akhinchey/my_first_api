require 'nokogiri'
require 'open-uri'
require 'uri'

class Api::V1::UrlsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # respond_to :json

  def index
    urls = Url.all
    render json: urls.as_json(include:[:h_one_tags, :h_two_tags, :h_three_tags, :internal_links])
  end

  def show
    url = Url.find_by(id: params[:id])
    render json: url.as_json(include:[:h_one_tags, :h_two_tags, :h_three_tags, :internal_links])
  end

  def create
    url = Url.new(url_params)

    if valid_url?(url.name)
      url.save
      html_file = open(url.name)
      nokogiri_doc = Nokogiri.parse(html_file)

      nokogiri_doc.css('a').each do |link_url|
        url.internal_links.create(content: link_url.attributes['href'])
      end

      nokogiri_doc.css('h1').each do |h1|
        url.h_one_tags.create(content: h1.inner_text.strip)
      end

      nokogiri_doc.css('h2').each do |h2|
        url.h_two_tags.create(content: h2.inner_text.strip)
      end

      nokogiri_doc.css('h3').each do |h3|
        url.h_three_tags.create(content: h3.inner_text.strip)
      end

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

  # def valid_url_string?(url)
  #   uri = URI.parse(url)
  #   uri.is_a?(URI::HTTP) && !uri.host.nil?
  #     rescue URI::InvalidURIError
  #   false
  # end

  def valid_url?(url)
    open(url)
    rescue => ex
    false 
  end
  
end
