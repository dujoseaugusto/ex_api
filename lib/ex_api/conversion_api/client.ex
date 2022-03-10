defmodule ExApi.ConversionApi.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://economia.awesomeapi.com.br"
  plug Tesla.Middleware.JSON

  def get_conversion(origin_currency,target_currency) do
    "/last/#{origin_currency}-#{target_currency}"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}
  defp handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, "Conversion not found!"}
  defp handle_get({:error, _reason} = error), do: error
end
