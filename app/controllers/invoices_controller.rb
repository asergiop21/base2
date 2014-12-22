class InvoicesController < ApplicationController

  require 'will_paginate'
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  autocomplete :customer, :name, :extra_data => [:lastname],  :display_value => :display_autocomplete
 
  # GET /invoices
  # GET /invoices.json

  def index
    @invoices = Invoice.caja_diaria
    @invoices = Invoice.find_by_filters(params[:q]) if params[:q].present?
    @invoices = @invoices.paginate(page: params[:page], per_page:10)
    @price_subtotal = Invoice.subtotal(@invoices) 
    @price_total = 0
    @total_invoices_stock = 0 
    @price_total = Invoice.total  
    @total_invoices_stock = InvoiceStock.total
    @caja = @price_total - @total_invoices_stock
  
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    1.times {@invoice.orders.build}
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    @id = @invoice.orders(params[:article_id])
    @quantity = Article.quantity_order(@id)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:id, :customer_id, :price_total, orders_attributes: [:id, :article_id, :quantity, :price_unit, :price_total, :discount, :name])
    end
end
