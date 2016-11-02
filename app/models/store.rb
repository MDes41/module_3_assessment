class Store
  attr_reader :name, :distance, :city, :phone, :type, :stores
  def initialize(store_data)
    @name = store_data[:longName]
    @distance = store_data[:distance]
    @city = store_data[:city]
    @phone = store_data[:phone]
    @type = store_data[:storeType]
  end

  def self.get_requested_stores(zip)
    conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,distance,city,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_KEY']}") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
    end

    json_parsed_response = JSON.parse(response.body, symbolize_names: true)

    json_parsed_response[:stores].map do |store_data|
      Store.new(store_data)
    end
  end

  def self.get_total_stores(zip)
    conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,distance,city,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_KEY']}") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
    end

    json_parsed_response = JSON.parse(response.body, symbolize_names: true)

    @total = json_parsed_response[:total]
  end

end
