defmodule ExmealsWeb.MealsControllerTest do
  use ExmealsWeb.ConnCase, async: true

  import Exmeals.Factory

  describe "create/2" do
    test "when all params are valid, creates a meal", %{conn: conn} do
      params = build(:meal_params)

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{"message" => "Meal created!"} = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = build(:meal_params, %{"descricao" => "aaa", "calorias" => -10})

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "calorias" => ["must be greater than or equal to 0"],
          "descricao" => ["should be at least 6 character(s)"]
        }
      }

      assert expected_response == response
    end
  end
end
