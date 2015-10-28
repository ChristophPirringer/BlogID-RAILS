class FoodsController < ApplicationController
  def index
    @foods = Food.all
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
