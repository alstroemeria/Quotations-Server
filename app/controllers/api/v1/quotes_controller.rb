module Api
  module V1
    class QuotesController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      respond_to :json
      
      def index
        respond_with Quote.all
      end
      
      def show
        respond_with Quote.find(params[:id])
      end
      
      def create
        if !quote_params[:category_id]
          category = Category.where(name: quote_params[:category]).first_or_create
          respond_with Quote.create(text: quote_params[:text], category_id: category.id)
        else
          respond_with Quote.create( quote_params)
        end
      end
      
      def update
        respond_with Quote.update(params[:id], params[:products])
      end
      
      def destroy
        respond_with Quote.destroy(params[:id])
      end
      
      private 
        def quote_params 
          params.require(:quote).permit(:text, :category, :category_id)
        end
    end
  end
end