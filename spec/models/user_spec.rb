require 'rails_helper'

describe User do
  describe "#destroy" do
    it "should delete bills when destroyed" do
      user = create(:user)
      Factura.create(user: user, amount: 10)

      user.destroy

      expect(Factura.all.count).to eq(0)
    end

    it "should delete debts user has to pay" do
      user = create(:user)
      debt = create(:debt, payer: user)

      user.destroy

      expect(Debt.all.count).to eq(0)
    end

    it "should delete debts user has to receive" do
      user = create(:user)
      debt = create(:debt, receiver: user)

      user.destroy

      expect(Debt.all.count).to eq(0)
    end
  end

  describe "#expenses" do
    it "should return the sum of all bills of a user" do
      # setup
      user = create(:user)
      create_list(:factura, 5, user: user)

      expect(user.expenses).to eq(50.0)
    end
  end

  describe "#all_except_self" do
    it "should return all users but self" do
      users = create_list(:user, 3)

      method_return = users[0].all_except_self

      expect(method_return).to match_array([users[1], users[2]])
    end
  end
end
