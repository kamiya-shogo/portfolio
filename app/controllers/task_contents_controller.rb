class TaskContentsController < ApplicationController
  before_action :set_user_id, except: [:order_list_manager]
  before_action :set_task_id, except: [:order_list_manager]
  before_action :set_task_content, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:new, :create, :edit]
  before_action :set_roast, only: [:new, :create, :edit]
  before_action :set_grind, only: [:new, :create, :edit]

  def index
  end
  
  def new
    @task_content = TaskContent.new
  end

  def create
    @task_content = @user.task_contents.build(cart_params)
    @task_content["task_id"] = params[:task_id]
    @task_content["user_name"] = @user.name
    @task_content["name"] = @task.name
    if @task_content[:edit_item].include?("100g")
      @task_content["price"] = @task.price
    elsif @task_content[:edit_item].include?("200g")
      @task_content["price"] = (@task.price*2)*0.95
    elsif @task_content[:edit_item].include?("300g")
      @task_content["price"] = (@task.price*3)*0.9
    elsif @task_content[:edit_item].include?("400g")
      @task_content["price"] = (@task.price*4)*0.85
    end
    if @task_content.save!
      flash[:success] = "カートへ追加しました。"                                                
      redirect_to edit_order_user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task_content.update(cart_params)
      flash[:success] = "更新しました"
      redirect_to edit_order_user_path(@user)
    else
      render 'edit_order'
    end
  end

  def destroy
    if @task_content.destroy
      @task_content.add_cart_status == nil
      flash[:success] = "削除しました"
      redirect_to edit_order_user_url(@user)
    end
  end
  
  def order_list_manager
    @lists = TaskContent.where(edit_order_status: "申請中").order("updated_at ASC")
    @lists_sum = TaskContent.where(edit_order_status: "申請中").count
  end

  private

    #注文したい豆をカートに追加
    def cart_params
      params.require(:task_content).permit(:edit_item, :edit_roast, :edit_grind).merge(add_cart_status:"申請中")
    end

end
