module Api
  module V1
    class AuthorsController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      respond_to :json
      
      def index
        respond_with Author.all
      end
      
      def show
        respond_with Author.find(params[:id])
      end
      
    end
  end
end