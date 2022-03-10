defmodule ExApiWeb.ConversionController do
  use ExApiWeb, :controller

  action_fallback ExApiWeb.FallbackController

  def show(conn, %{"origin_currency" => origin_currency,"target_currency" => target_currency}) do
    origin_currency
    |> ExApi.fetch_conversion(target_currency)
    |> handle_response(conn)
  end

  defp handle_response({:ok, conversion}, conn) do
    conn
    |> put_status(:ok)
    |> json(conversion)
  end

  defp handle_response({:error, _reason} = error, _conn), do: error
end
