class PagesController < ApplicationController

  def home
    @total_casa = 0.0
    User.all.each do |user|
      @total_casa += user.total
    end
  end
end
