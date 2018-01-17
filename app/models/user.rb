class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :facturas, dependent: :destroy

  def total
    total_spent = 0.0
    self.facturas.each do |factura|
      total_spent += factura.amount
    end
    return total_spent
  end

  def all_except_self
    User.where.not(id: self.id)
  end
end
