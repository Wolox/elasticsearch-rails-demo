class SearchController < ApplicationController
  def index
    search_result = Elasticsearch::Model.search(params[:query].to_s, [KarateDojo]).records.records
    render json: search_result, status: :found
  end
end
