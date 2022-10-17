class HomeController < ApplicationController
  def search
    if params[:filters].present?
      api_results = Unsplash::Photo.search(search_params[:filters][:query], params[:page] || 1, 30)
      @results = Kaminari.paginate_array(api_results, total_count: api_results.total_pages).page(params[:page]).per(30)
    else
      @results = []
    end
  end

  private

  def search_params
    params.permit(filters: [:query, :color])
  end
end
