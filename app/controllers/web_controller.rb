class WebController < ApplicationController
  
  RECENTLY_PRODUCTS_PER_PAGE = 4
  RECOMMEND_PRODUCTS_PER_PAGE = 3
  
  def index
    if sort_params.present?
      @products = Product.sort_products(sort_params, params[:page])
      @category = Category.request_category(sort_params[:sort_category])
    elsif params[:category].present?
      @category = Category.request_category(params[:category])
      @products = Product.category_products(@category, params[:page])
    else
      @products = Product.display_list(params[:page])
    end
    
    @categories = Category.all
    @major_category_names = Category.major_categories
    @sort_list = Product.sort_list
    @recently_products = Product.recently_products(RECENTLY_PRODUCTS_PER_PAGE)
    @recommend_products = Product.recommend_products(RECOMMEND_PRODUCTS_PER_PAGE)
  end
  
  private
  
  def sort_params
    params.permit(:sort, :sort_category)
  end
end
