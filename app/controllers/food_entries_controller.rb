class FoodEntriesController < ApplicationController
  before_action :set_food_entry, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /admin_entries
  def admin
    
    @food_entries = FoodEntry.all

    render json: @food_entries
  end

  # GET /food_entries
  def index
    
    @food_entries = FoodEntry.where(user_id: @user.id)

    render json: @food_entries
  end

  # GET /food_entries/1
  def show
    render json: @food_entry
  end

  # POST /food_entries
  def create
    @food_entry = FoodEntry.new(food_entry_params)
    @food_entry.user_id = @user.id

    if @food_entry.save
      render json: @food_entry, status: :created, location: @food_entry
    else
      render json: @food_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /food_entries/1
  def update
    if @food_entry.update(food_entry_params)
      render json: @food_entry
    else
      render json: @food_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /food_entries/1
  def destroy
    @food_entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_entry
      @food_entry = FoodEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_entry_params
      params.require(:food_entry).permit(:food, :calories)
    end
end
