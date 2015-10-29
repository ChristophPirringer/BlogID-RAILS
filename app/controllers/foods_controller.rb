class FoodsController < ApplicationController
  def index
    if current_user
      if params[:search] && params[:search] != ""
        @foods = current_user.foods.all.paginate( page: params[:foods_page], :per_page => 5)
        @exercises = current_user.exercises.all.paginate( page: params[:exercises_page], :per_page => 5)
        @searchedFoods = current_user.foods.all.search(params[:search]).paginate( page: params[:searched_foods_page], :per_page => 5)
        @searchedExercises = current_user.exercises.all.search(params[:search]).paginate( page: params[:searched_exercises_page], :per_page => 5)
      else
        @searchedFoods = current_user.foods.all.paginate( page: params[:searched_foods_page], :per_page => 5)
        @searchedExercises = current_user.exercises.all.paginate( page: params[:searched_exercises_page], :per_page => 5)
        @foods = current_user.foods.all.paginate( page: params[:foods_page], :per_page => 5)
        @exercises = current_user.exercises.all.paginate( page: params[:exercises_page], :per_page => 5)
      end
    else
      redirect_to new_user_session_path
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
