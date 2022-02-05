class IbansController < ApplicationController
  before_action :set_iban, only: %i[show update destroy]

  # GET /ibans
  def index
    @ibans = Iban.all

    render json: @ibans
  end

  # GET /ibans/1
  def show
    render json: @iban
  end

  # POST /ibans
  def create
    @iban = Iban.new(iban_params)

    if @iban.save
      render json: @iban, status: :created, location: @iban
    else
      render json: @iban.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ibans/1
  def update
    if @iban.update(iban_params)
      render json: @iban
    else
      render json: @iban.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ibans/1
  def destroy
    @iban.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_iban
    @iban = Iban.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def iban_params
    params.require(:iban).permit(:number, :name)
  end
end

