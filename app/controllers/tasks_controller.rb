class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: %i(show edit update destroy edit_add_cart update_add_cart)
  before_action :set_item, only: %i(edit_add_cart)
  before_action :set_roast, only: %i(edit_add_cart)
  before_action :set_grind, only: %i(edit_add_cart)

  
  
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
      redirect_to user_task_url(@user,@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url(@user)
  end

  def edit_add_cart
  end

  def update_add_cart
  end
  
  private
    
    def task_params
      params.require(:task).permit(:name, :description)
    end

    #注文をカートに追加
    def cart_params
      params.require(:task).permit(:edit_item, :edit_roast, :edit_grind, :add_cart_status)
    end
    
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
