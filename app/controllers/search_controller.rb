class SearchController < ApplicationController
  def index
    @stores = Store.get_requested_stores(search_params[:search])
    @total = Store.get_total_stores(search_params[:search])
  end

  private
    def search_params
      params.require(:search).permit(:search)
    end
end
