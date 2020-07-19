class HumstersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  PER=6

  def index
  	@humsters=Humster.page(params[:page]).per(PER)
  end

  def show
  	@humster=Humster.find(params[:id])

    @comments = @humster.comments.includes(:user).page(params[:page]).per(PER)
    @comment=@humster.comments.build(user_id: current_user.id) if current_user
  end

  def new
  	@humster=Humster.new
  end

  def create
  	@humster=Humster.new(humster_params)
  	@humster.user_id=current_user.id
  	if @humster.save
  	redirect_to humster_path(@humster),notice:"投稿に成功しました"
    else
      render :new
    end
  end

  def edit
  	@humster=Humster.find(params[:id])
    if @humster.user != current_user
      redirect_to humsters_path,alert:"不正アクセスです"
    end
  end

  def update
  	@humster=Humster.find(params[:id])
  	if @humster.update(humster_params)
  	redirect_to humster_path(@humster)
    else
      render :edit
    end
  end

  def destroy
    humster=Humster.find(params[:id])
    humster.destroy
    redirect_to humsters_path
    
  end

  private
  def humster_params
  	params.require(:humster).permit(:title,:body,:image)
  end


end
