class TasksController < ApplicationController
  before_action :set_user_id
  before_action :set_task, only: [:show, :edit, :update, :destroy, :edit_add_cart, :update_add_cart, :edit_cart, :order_edit, :order_update, :order_delete]
  # before_action :set_task_id, only: [:index]
  before_action :set_item, only: %i(edit_add_cart order_edit)
  before_action :set_roast, only: %i(edit_add_cart order_edit)
  before_action :set_grind, only: %i(edit_add_cart order_edit)

  
  
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url(@user)
    else
      render :new
    end
  end

  def edit 
  end

  def update
    if @task.update(task_params)
      flash[:success] = "更新しました。"
      redirect_to user_tasks_path(@user,@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url(@user)
  end

  # カートへ追加
  def edit_add_cart
  end

  def update_add_cart
    ActiveRecord::Base.transaction do # トランザクションを開始します。
      if @task.update!(cart_params)
        flash[:success] = "カートに追加しました！"
      end
    end
    redirect_to edit_order_user_path(@user) 
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
    flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
    redirect_to user_tasks_url(@user)
  end

  
  private
    
    def task_params
      params.require(:task).permit(:name, :description)
    end
end
