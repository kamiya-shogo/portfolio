class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def set_user_id
    @user = User.find(params[:user_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_task_id
    @task = Task.find(params[:task_id])
  end

  def set_task_content
    @task_content = TaskContent.find(params[:id])
  end

  def set_item
    @items = [
      "100g　/　#{item_price(@task.price,"100g")}円",
      "200g　/　#{item_price(@task.price,"200g")}円　（5割引）",
      "300g　/　#{item_price(@task.price,"300g")}円　（10割引）",
      "400g　/　#{item_price(@task.price,"400g")}円　（15割引）",
    ]
  end

  def set_roast
    @roasts = [
      "焙煎士にお任せ",
      "浅煎り（酸味と甘い香り）",
      "中煎り（酸味と苦味）",
      "深煎り（苦味と香ばしさ）",
    ]
  end
  
  def set_grind
    @grinds = [
      "豆のまま",
      "粗挽き",
      "中挽き",
      "細挽き",
    ]
  end

  # コーヒー豆の個数計算
  def item_price(price,gram)
    case gram
    when "100g"
      format("%.0f", price*1)
    when "200g"
      format("%.0f", (price*2)*0.95)
    when "300g"
      format("%.0f", (price*3)*0.9)
    when "400g"
      format("%.0f",(price*4)*0.85 )
    end
    # if gram == "100g"
    #   format("%.0f", price*1)
    # elsif gram == "200g"
    #   format("%.0f", (price*2)*0.95)
    # elsif gram == "300g"
    #   format("%.0f", (price*3)*0.9)
    # else gram == "400g"
    #   format("%.0f",(price*4)*0.85 )
    # end
  end
end   