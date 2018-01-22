class PagesController < ApplicationController

  def home
    debt_calculator = DebtCalculator.new(User.all)
    @home_total = debt_calculator.home_total
    @transactions = debt_calculator.bilan
    @user_owes = @transactions.select { |transaction| transaction[:giver] == current_user.id }
    @user_is_owed = @transactions.select { |transaction| transaction[:receiver] == current_user.id }
  end
end
