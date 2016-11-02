class SearchController < ApplicationController
  def index
    response = Store.get_requested_stores(search_params[:search])

    json_parsed_response = JSON.parse(response.body, symbolize_names: true)

    @total = json_parsed_response[:total]
    @stores = json_parsed_response[:stores].map do |store_data|
      Store.new(store_data)
    end
    # byebug
  end

  private
    def search_params
      params.require(:search).permit(:search)
    end
end
