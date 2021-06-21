defmodule ExmealsWeb.MealsController do
  use ExmealsWeb, :controller

  alias Exmeals.Meals.Meal
  alias ExmealsWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeals.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeals.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Exmeals.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{}} <- Exmeals.delete(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
