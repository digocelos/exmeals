defmodule ExmealsWeb.FallbackController do
  use ExmealsWeb, :controller

  alias Exmeals.Error
  alias ExmealsWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
