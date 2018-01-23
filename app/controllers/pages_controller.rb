class PagesController < ApplicationController
  def home
    debt_calculator = DebtCalculator.new(User.all)
    @home_total = debt_calculator.home_total
    @transactions = debt_calculator.bilan
    @user_owes = @transactions.select { |tr| tr[:giver] == current_user.id }
    @user_is_owed = @transactions.select { |tr| tr[:receiver] == current_user.id }
  end
end
