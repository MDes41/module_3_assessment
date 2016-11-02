class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,distance,city,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_KEY']}") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
    end
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,distance,city,phone,storeType&apiKey=#{ENV['BEST_BUY_KEY']}")
    json_parsed_response = JSON.parse(response.body, symbolize_names: true)
    @total = json_parsed_response[:total]
    @stores = json_parsed_response[:stores].map do |store_data|
      Store.new(store_data)
    end
    # byebug
  end
end
