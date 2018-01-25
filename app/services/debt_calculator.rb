class DebtCalculator
  attr_reader :home_total
  def initialize(users)
    @users = users
    @home_total = @users.inject(0) { |sum, user| sum + user.expenses }
    @total_per_user = @home_total / (@users.size)
  end

  # u2 donne à u1
  def change_between_users(u1, u2, value)
    u1.debt += value
    u2.debt -= value
    { receiver: u1.id, giver: u2.id, value: value.round(2) }
  end

  def calc_total_debt(user)
    user.debt = (@total_per_user - user.expenses)
  end
  # TODO, 20 / 3
  def bilan
    @users.each do |u|
      calc_total_debt(u)
    end
    transactions = []
    until @users.size <= 1
      @users = @users.sort
      first = @users.first
      last = @users.last
      value_change = [first.debt.abs, last.debt.abs].minmax[0]
      transactions << change_between_users(first, last, value_change) unless value_change.zero?
      @users.reject! { |u| u.debt.zero? }
    end
    transactions
  end
end
