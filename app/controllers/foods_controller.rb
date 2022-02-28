class FoodsController < ApplicationController
  before_action :authorized
  # before_action :set_food, only: [:show, :update, :destroy]
  
  def admin 
    @foods = Food.all
    render json: @foods
  end

  def new
    @users = User.all

    for user in @users do
      puts user.id
      @food = Food.new(food_params)
      @food.user = user
      @food.save
    end

    admin

  end
  # GET /foods
  def index
    @foods = Food.where(user_id: @user.id)
      
    render json: @foods
  end

  # GET /foods/1
  def show
    set_food
    render json: @food
  end

  # POST /foods
  def create
    p @user
    @food = Food.new(food_params)
    @food.user = @user
    if @food.save
      render json: @food, status: :created, location: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foods/1
  def update
    set_food
    if @food.update(food_params)
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1
  def destroy
    set_food
    @food.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      puts "set food"
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:product, :calories, :date, :time)
    end
end
