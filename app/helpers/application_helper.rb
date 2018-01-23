module ApplicationHelper
  def debt_string(debt)
    if debt.positive?
      "Debes #{debt} €"
    else
      "Te deben #{- debt} €"
    end
  end
end
