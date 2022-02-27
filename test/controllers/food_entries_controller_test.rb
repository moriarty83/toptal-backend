require "test_helper"

class FoodEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_entry = food_entries(:one)
  end

  test "should get index" do
    get food_entries_url, as: :json
    assert_response :success
  end

  test "should create food_entry" do
    assert_difference('FoodEntry.count') do
      post food_entries_url, params: { food_entry: { calories: @food_entry.calories, food: @food_entry.food } }, as: :json
    end

    assert_response 201
  end

  test "should show food_entry" do
    get food_entry_url(@food_entry), as: :json
    assert_response :success
  end

  test "should update food_entry" do
    patch food_entry_url(@food_entry), params: { food_entry: { calories: @food_entry.calories, food: @food_entry.food } }, as: :json
    assert_response 200
  end

  test "should destroy food_entry" do
    assert_difference('FoodEntry.count', -1) do
      delete food_entry_url(@food_entry), as: :json
    end

    assert_response 204
  end
end
