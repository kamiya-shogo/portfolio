module UsersHelper

  def total_price(price, total)
    format("%.0f", (total += price))
  end
end
