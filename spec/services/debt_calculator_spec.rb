require 'rails_helper'

describe DebtCalculator do
  describe "#bilan" do
    it "should return an empty array if all users spent the same" do
      users = []
      3.times do |i|
        users << create(:user, email: "#{i}@test.com")
        Factura.create(user: users.last, amount: 10)
      end
      debt_calculator = DebtCalculator.new(users)

      expect(debt_calculator.bilan).to be_empty
    end

    it "should return the correct hash" do
      users = []
      3.times do |i|
        users << create(:user, email: "#{i}@test.com")
        Factura.create(user: users.last, amount: 10 * (i + 1) * ((i + 1)**2))
        # fisrt user: 10, second user: 80, third user: 270
      end
      debt_calculator = DebtCalculator.new(users)

      expected_array = [
        {
          receiver: users.last.id,
          giver: users.first.id,
          value: 110.0
        },
        {
          receiver: users.last.id,
          giver: users[1].id,
          value: 40.0
        }
      ]

      expect(debt_calculator.bilan).to eq(expected_array)
    end
  end
end
