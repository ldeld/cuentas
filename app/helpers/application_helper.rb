module ApplicationHelper
  def debt_string(debt)
    if debt > 0
      return "Debes #{debt} €"
    else
      return "Te deben #{- debt} €"
    end
  end
end
