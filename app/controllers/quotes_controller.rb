class QuotesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
    respond_to do |format|
      format.html
      format.json { render json: @quotes, each_serializer: QuoteSerializer }
    end
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @quote }
    end
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quote }
      else
        format.html { render action: 'new' }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url }
    end
  end
  
  def update
    @quote = Quote.find(params[:id])
    @quote.update(favorites: @quote.favorites + 1)
    respond_with @quote
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:text)
    end
end
