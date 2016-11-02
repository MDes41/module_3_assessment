class Store
  attr_reader :name, :distance, :city, :phone, :type, :stores
  def initialize(store_data)
    @name = store_data[:longName]
    @distance = store_data[:distance]
    @city = store_data[:city]
    @phone = store_data[:phone]
    @type = store_data[:storeType]
  end

  def self.get_requested_data(zip)
    BestBuyApiService.get_requested_stores(zip)
  end

  def self.get_requested_stores(zip)
    get_requested_data(zip)[:stores].map do |store_data|
      Store.new(store_data)
    end
  end

  def self.get_total_stores(zip)
    get_requested_data(zip)[:total]
  end
end
