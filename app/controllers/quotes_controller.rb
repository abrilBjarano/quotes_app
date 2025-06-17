# app/controllers/quotes_controller.rb
class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]

  # GET /quotes or /quotes.json
  def index
    @quotes = current_company.quotes.ordered
  end

  # GET /quotes/1 or /quotes/1.json
  def show
    @line_item_dates = @quote.line_item_dates.ordered
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  def create
    @quote = current_company.quotes.build(quote_params)

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
      end
    else
      render :new
    end
  end

  # All the previous code

  def update
  if @quote.update(quote_params)
    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
    end
  else
    render :edit, status: :unprocessable_entity
  end
end

  # All the previous code

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:name)
    end

    private
    
    def set_quote
    # We must use current_company.quotes here instead of Quote
    # for security reasons
    @quote = current_company.quotes.find(params[:id])
    end
end