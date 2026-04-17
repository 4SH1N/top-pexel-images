class StaticPagesController < ApplicationController
  def home
    if params[:collection_id].present?
      client = PexelsClient.new
      response = client.collection_photos(params[:collection_id])

      if response.success?
        @photos = response.parsed_response["media"]
      else
        @error = "ERROR! can't find the collection"
      end
    end
  end
end
