require 'rails_helper'

describe User do
  it "should delete bills when destroyed" do
    user = create(:user)
    Factura.create(user: user, amount: 10)

    user.destroy

    expect(Factura.all.count).to eq(0)
  end

  describe "#expenses" do
    it "should return the sum of all bills of a user" do
      # setup
      user = create(:user)
      5.times do
        Factura.create(user: user, amount: 10)
      end

      expect(user.expenses).to eq(50.0)
    end
  end

  describe "#all_except_self" do
    it "should return all users but self" do
      users = []
      3.times do |i|
        users << create(:user, email: "#{i}@test.com")
      end

      method_return = users[0].all_except_self

      expect(method_return).to match_array([users[1], users[2]])
    end
  end
end
