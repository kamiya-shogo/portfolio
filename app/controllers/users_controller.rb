class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_order, :update_order, :order_index, :order_show]
  before_action :set_task_content, only: []
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_order
    @carts = TaskContent.where(user_id: current_user.id, add_cart_status: "申請中")
    @carts_sum = TaskContent.where(user_id: current_user.id, add_cart_status: "申請中").count
  end

  def update_order
    task_contents = @user.task_contents
    task_contents.each do |item|
      item.add_cart_status = nil
      item.update(order_params)
    end
    flash[:success] = "注文しました。"
    redirect_to order_index_user_path(@user)
  end

  def order_index
    @orders = TaskContent.where(user_id: current_user.id, edit_order_status: "申請中").order("created_at ASC")
    @orders_sum = TaskContent.where(user_id: current_user.id, edit_order_status: "申請中").count
  end

  def order_show
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #商品を注文
    def order_params
      params.require(:user).permit(:edit_order_status)
    end

    # beforeフィルター

    # paramsハッシュからユーザーを取得します。
    def set_user
      @user = User.find(params[:id])
    end

    # ログイン済みのユーザーか確認します。
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end

    # アクセスしたユーザーが現在ログインしているユーザーか確認します。
    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end

    # システム管理権限所有かどうか判定します。
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
