module Api
  module V1
    class QuotesController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      respond_to :json
      

      def index
        page = params.has_key?(:page)? params[:page] : 1
        per_page = params.has_key?(:limit)? params[:limit] : 25
        mode = params.has_key?(:mode)? params[:mode] : ''
        time = params.has_key?(:t)? params[:t] : 'year'
        
        case(time)
          when 'year'
            start = 1.year.ago
          when 'month'
            start = 1.month.ago
          when 'week'
            start = 1.week.ago
          when 'day'
            start = 1.year.ago
        end
        
        case(mode)
          when "top"         
            quotes = Quote.order('favorites desc')
          when "new"
            quotes = Quote.order('created_at desc')
          else 
            quotes = Quote.order('created_at desc')
        end
        respond_with quotes.created_between(start, Time.now).page(page).per(per_page)
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
      
      def favorite
        quote = Quote.find(params[:id])
        quote.update(favorites: quote.favorites + 1)
        respond_with quote
      end
      

      
      private 
        def quote_params 
          params.require(:quote).permit(:text, :category, :category_id)
        end
    end
  end
end