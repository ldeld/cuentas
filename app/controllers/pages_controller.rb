class PagesController < ApplicationController

  def home
    @home_total = 0.0
    User.all.each do |user|
      @home_total += user.expenses
    end
  end
end
