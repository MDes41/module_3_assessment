class SearchController < ApplicationController
  def index
    @stores = Store.get_requested_stores(search_params[:search])

    # json_parsed_response = JSON.parse(response.body, symbolize_names: true)

    @total = Store.get_total_stores(search_params[:search])
    # @stores = json_parsed_response.stores
  end

  private
    def search_params
      params.require(:search).permit(:search)
    end
end
