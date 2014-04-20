module Api
  module V1
    class QuotesController < ApplicationController
      respond_to :json
      
      def index
        respond_with Quote.all
      end
      
      def show
        respond_with Quote.find(params[:id])
      end
      
      def create
        respond_with Quote.create(params[:product])
      end
      
      def update
        respond_with Quote.update(params[:id], params[:products])
      end
      
      def destroy
        respond_with Quote.destroy(params[:id])
      end
    end
  end
end