class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def set_item
    @items = [
      "100g　/　600円",
      "200g　/　1140円　（5%割引）",
      "300g　/　1620円　（10%割引）",
      "400g　/　2040円　（15%割引）",
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
end   