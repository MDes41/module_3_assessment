class Store
  attr_reader :name, :distance, :city, :phone, :type
  def initialize(store_data)
    @name = store_data[:longName]
    @distance = store_data[:distance]
    @city = store_data[:city]
    @phone = store_data[:phone]
    @type = store_data[:storeType]
  end
end
