class InvoiceStocksController < ApplicationController

  require 'will_paginate'
  before_action :set_invoice_stock, only: [:show, :edit, :update, :destroy]

  # GET /invoice_stocks
  # GET /invoice_stocks.json
  def index
    @invoice_stocks = InvoiceStock.order(created_at: :desc)
    @invoice_stocks = @invoice_stocks.paginate(page: params[:page], per_page:10)
  
    end

  # GET /invoice_stocks/1
  # GET /invoice_stocks/1.json
  def show
  end

  # GET /invoice_stocks/new
  def new
    @invoice_stock = InvoiceStock.new
    1.times {@invoice_stock.stocks.build}
  end

  # GET /invoice_stocks/1/edit
  def edit
  end

  # POST /invoice_stocks
  # POST /invoice_stocks.json
  def create
    @invoice_stock = InvoiceStock.new(invoice_stock_params)
    #@quantity = Stock.update_quantity(invoice_stock_params[:stocks_attributes])
    respond_to do |format|
      if @invoice_stock.save
        format.html { redirect_to invoice_stocks_path, notice: 'Invoice stock was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_stock }
      else
        format.html { render :new }
        format.json { render json: @invoice_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_stocks/1
  # PATCH/PUT /invoice_stocks/1.json
  def update
    respond_to do |format|
      if @invoice_stock.update(invoice_stock_params)
        format.html { redirect_to invoice_stocks_path, notice: 'Invoice stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_stock }
      else
        format.html { render :edit }
        format.json { render json: @invoice_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_stocks/1
  # DELETE /invoice_stocks/1.json
  def destroy
    @invoice_stock.destroy
    respond_to do |format|
      format.html { redirect_to invoice_stocks_url, notice: 'Invoice stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_stock
      @invoice_stock = InvoiceStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_stock_params
      params.require(:invoice_stock).permit(:name, :price_total, stocks_attributes:[:id, :article_id, :price_cost, :quantity, :supplier_id, :due_date, :category_id, :price_total] )
    end
end
