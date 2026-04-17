# app/services/pexels_client.rb

class PexelsClient
  include HTTParty
  base_uri "https://api.pexels.com/v1"

  def initialize
    @headers = {
      "Authorization" => ENV["MY_API_KEY"]
    }
  end

  def collection_photos(collection_id)
    self.class.get(
      "/collections/#{collection_id}",
      headers: @headers,
      query: { type: "photos" }
    )
  end
end
