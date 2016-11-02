class BestBuyApiService

  def initialize(zip)
    @faraday = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{zip},25))") do |faraday|
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
      req.params[:format] = 'json'
      req.params[:show] = 'longName,distance,city,phone,storeType'
      req.params[:pageSize] = '15'
      req.params[:apiKey] = ENV['BEST_BUY_KEY']
    end
  end
end
