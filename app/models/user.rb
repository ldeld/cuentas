class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :facturas, dependent: :destroy
  has_many :debts_to_pay, class_name: 'Debt', foreign_key: 'payer_id', dependent: :destroy
  has_many :debts_to_receive, class_name: 'Debt', foreign_key: 'receiver_id', dependent: :destroy
  attr_accessor :debt

  def expenses
    total_spent = 0.0
    facturas.each do |factura|
      total_spent += factura.amount
    end
    total_spent
  end

  def <=>(other)
    other.expenses <=> expenses
  end

  def all_except_self
    User.where.not(id: id)
  end
end
