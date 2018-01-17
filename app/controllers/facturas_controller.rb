class FacturasController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]

  def index
    @facturas = Factura.where(user_id: params[:user_id])
  end

  def show
  end

  def new
    @factura = Factura.new
  end

  def create
    @factura = Factura.new(factura_params)
    @factura.user = current_user
    if @factura.save
      redirect_to user_facturas_path(current_user)
    else
      binding.pry
      render :new
    end
  end

  def update
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def factura_params
    params.require(:factura).permit(:amount, :description)
  end
end
