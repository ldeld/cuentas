class DebtsController < ApplicationController
  before_action :find_user

  def index
    @debts_to_pay = Debt.where(payer: @user)
    @debts_to_receive = Debt.where(receiver: @user)
  end

  def show
  end

  def new
    @debt = Debt.new
  end

  def create
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
