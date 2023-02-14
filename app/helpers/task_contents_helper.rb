module TaskContentsHelper

  def price_calculation(price, gram)
    case gram
    when "100g"
      format("%.0f", price*1)
    when "200g"
      format("%.0f", price*1)
    when "300g"
      format("%.0f", price*1)
    when "400g"
      format("%.0f", price*1)
    end
  end

  def subtotal_calculation(price, price1)
    format("%f", (  ))
  end
end
