defmodule Exmeals.Meals.GetTest do
  use Exmeals.DataCase, async: true

  import Exmeals.Factory
  alias Exmeals.Error
  alias Exmeals.Meals.{Create, Get, Meal}

  describe "by_id/1" do
    setup do
      params = build(:meal_params)
      {:ok, %Meal{id: id}} = Create.call(params)
      {:ok, id: id}
    end

    test "When a valid id is given, returns the meal", %{id: id} do
      response = Get.by_id(id)

      assert {:ok, %Meal{id: _id, calorias: 600, descricao: "Arroz com ovo"}} = response
    end

    test "When an invalid id is given, returns an error" do
      response = Get.by_id("00000000-0000-0000-0000-000000000000")

      assert {:error, %Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
