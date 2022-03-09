defmodule ExApiWeb.UsersController do
  use ExApiWeb, :controller

  alias ExApiWeb.Auth.Guardian

  action_fallback ExApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, user} <- ExApi.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("create.json", %{user: user, token: token})
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ExApi.delete_user()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ExApi.fetch_user()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> ExApi.update_user()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_delete({:ok, _user}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, user}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, user: user)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
