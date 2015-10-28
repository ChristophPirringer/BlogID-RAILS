class FoodsController < ApplicationController
  def index
    if params[:search] && params[:search] != ""
      @foods = current_user.foods.all.search(params[:search])
      @exercises = current_user.exercises.all.search(params[:search])
    else
      @foods = current_user.foods.all
      @exercises = current_user.exercises.all
    end
  end

  def new
    @user = User.find(params[:user_id])
    @food = Food.new
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.new(food_params)
    if @food.save
      respond_to do |format|
        format.html { redirect_to foods_path }
        format.js
      end
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories, :user_id)
  end
end
