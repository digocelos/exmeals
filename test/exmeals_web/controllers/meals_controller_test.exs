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

  describe "update/2" do
    test "when id exist, update the meal", %{conn: conn} do
      id = "07d0c2ba-c86b-4ebf-b8ca-32d761e049af"
      insert(:meal)

      params = build(:meal_params)

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:ok)

      assert %{"meal" => %{"id" => _id, "descricao" => "Arroz com ovo"}} = response
    end

    test "when not exist id, return an error", %{conn: conn} do
      id = "07d0c2ba-c86b-4ebf-b8ca-32d761e049a2"
      params = build(:meal_params)

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:not_found)

      expected_response = %{
        "message" => "Meal not found"
      }

      assert expected_response == response
    end
  end

  describe "get/2" do
    test "when id exist, return the meal", %{conn: conn} do
      id = "07d0c2ba-c86b-4ebf-b8ca-32d761e049af"
      insert(:meal)

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"meal" => %{"id" => _id, "descricao" => "Arroz com batatas"}} = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = "07d0c2ba-c86b-4ebf-b8ca-32d761e049a2"

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:not_found)

      expected_responde = %{
        "message" => "Meal not found"
      }

      assert expected_responde == response
    end
  end

  describe "delete/2" do
    test "when id exist, delete the meal", %{conn: conn} do
      id = "07d0c2ba-c86b-4ebf-b8ca-32d761e049af"
      insert(:meal)

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      id = "07d0c2ba-c86b-4ebf-b8ca-32d761e049a2"

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> json_response(:not_found)

      expected_responde = %{
        "message" => "Meal not found"
      }

      assert expected_responde == response
    end
  end
end
