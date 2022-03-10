defmodule ExApi.Conversion.Get do
  alias ExApi.ConversionApi.Client
  alias ExApi.Conversion

  def call(origin_currency,target_currency) do
    origin_currency
    |> Client.get_conversion(target_currency)
    |> fixParams()
    |> handle_response()
  end

  defp fixParams({:ok, body}) do
    body = Enum.map(body, fn ({key, value}) -> value end)
    hd body
  end

  defp fixParams({:error, _reason} = error), do: error

  defp handle_response(body), do: {:ok, Conversion.build(body)}
  defp handle_response({:error, _reason} = error), do: error
end
