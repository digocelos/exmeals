defmodule Exmeals.Factory do
  use ExMachina.Ecto, repo: Exmeals.Repo

  alias Exmeals.Meals.Meal

  def meal_params_factory do
    %{
      "descricao" => "Arroz com ovo",
      "data" => "2021-06-21 23:00:01",
      "calorias" => 600
    }
  end

  def meal_factory do
    %Meal{
      descricao: "Arroz com batatas",
      data: ~N[2021-06-21 23:00:01],
      calorias: 1200,
      id: "07d0c2ba-c86b-4ebf-b8ca-32d761e049af"
    }
  end

  def meal_update_params_factory do
    %{
      "id" => "",
      "descricao" => "Arroz com bacalhau",
      "calorias" => 1300
    }
  end
end
