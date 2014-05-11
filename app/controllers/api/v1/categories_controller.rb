module Api
  module V1
    class CategoriesController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      respond_to :json
      
      def index
        respond_with Category.all
      end
      
      def show
        respond_with Category.find(params[:id])
      end 
      
    end
  end
end