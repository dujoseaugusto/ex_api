defmodule ExApiWeb.WelcomeController do
  use ExApiWeb, :controller

  def index(conn, _pararms) do
    text(conn, "teste")
  end
end
