defmodule ExApiWeb.UsersView do
  use ExApiWeb, :view

  alias ExApi.User

  def render("create.json", %{
        user: %User{id: id, name: name, inserted_at: inserted_at},
        token: token
      }) do
    %{
      message: "User created!",
      user: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      },
      token: token
    }
  end

  def render("sign_in.json", %{token: token}) do
    %{token: token}
  end

  def render("show.json", %{user: %User{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at
    }
  end

  def render("update.json", %{
        user: %User{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at}
      }) do
    %{
      message: "User updated!",
      user: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        updated_at: updated_at
      }
    }
  end
end
