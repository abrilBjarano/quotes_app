class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only: [:edit, :update, :destroy] # <--- ¡AGREGA ESTA LÍNEA AQUÍ!

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    if @line_item_date.save
      redirect_to quote_path(@quote), notice: "Date was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit # ESTE ES PÚBLICO
  end

  def update # ESTE ES PÚBLICO
    if @line_item_date.update(line_item_date_params)
      redirect_to quote_path(@quote), notice: "Date was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy # ESTE ES PÚBLICO
    @line_item_date.destroy
    redirect_to quote_path(@quote), notice: "Date was successfully destroyed."
  end

  private # <--- ¡UN SOLO BLOQUE PRIVATE!

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date # ESTE ES PRIVADO, Y ES LLAMADO POR EL before_action
    @line_item_date = @quote.line_item_dates.find(params[:id])
  end
end