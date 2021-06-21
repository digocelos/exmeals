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
end
