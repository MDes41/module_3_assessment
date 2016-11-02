class BestBuyApiService

  def initialize(zip)
    @faraday = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,distance,city,phone,storeType&pageSize=15&apiKey=#{ENV['BEST_BUY_KEY']}") do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def self.get_requested_stores(zip)
    new(zip).parsed
  end

  def parsed
    JSON.parse(conn.body, symbolize_names: true)
  end

  def conn
    @faraday.get do |req|
      #going to refactor and pull params out of initialize 
    end
  end
end
