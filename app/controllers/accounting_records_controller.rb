class AccountingRecordsController < ApplicationController

  require 'will_paginate'
  before_action :set_accounting_record, only: [:show, :edit, :update, :destroy]

  # GET /accounting_records
  # GET /accounting_records.json
  def index
    @accounting_records = AccountingRecord.journal
    @accounting_records = AccountingRecord.filters(params[:q]) if params[:q].present?
    @credit = AccountingRecord.credit(@accounting_records)
    @debit = AccountingRecord.debit(@accounting_records)
    @caja_total = @debit - @credit
    @accounting_records =  @accounting_records.paginate(page: params[:page], per_page:10)

    @earnings = AccountingRecord.earnings(params[:q]) if params[:q].present? 

    @earnings = AccountingRecord.earnings if (params[:q].nil?)

  
  end

  # GET /accounting_records/1
  # GET /accounting_records/1.json
  def show
  end

  # GET /accounting_records/new
  def new
    @accounting_record = AccountingRecord.new
  end

  # GET /accounting_records/1/edit
  def edit
  end

  # POST /accounting_records
  # POST /accounting_records.json
  def create
    @accounting_record = AccountingRecord.new(accounting_record_params)

    respond_to do |format|
      if @accounting_record.save
        format.html { redirect_to accounting_records_path, notice: 'Accounting record was successfully created.' }
        format.json { render :show, status: :created, location: @accounting_record }
      else
        format.html { render :new }
        format.json { render json: @accounting_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounting_records/1
  # PATCH/PUT /accounting_records/1.json
  def update
    respond_to do |format|
      if @accounting_record.update(accounting_record_params)
        format.html { redirect_to @accounting_record, notice: 'Accounting record was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounting_record }
      else
        format.html { render :edit }
        format.json { render json: @accounting_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_records/1
  # DELETE /accounting_records/1.json
  def destroy
    @accounting_record.destroy
    respond_to do |format|
      format.html { redirect_to accounting_records_url, notice: 'Accounting record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_record
      @accounting_record = AccountingRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_record_params
      params.require(:accounting_record).permit(:detail, :debit, :credit)
    end
end
