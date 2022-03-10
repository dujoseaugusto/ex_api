defmodule ExApi.User.Conversion.Create do
  alias ExApi.Conversion
  alias ExApi.User.Conversion, as: UserConversion
  alias ExApi.ConversionApi.Client
  alias ExApi.Repo

  def call(%{"origin_currency" => origin_currency, "target_currency" => target_currency} = params) do
    origin_currency
    |> Client.get_conversion(target_currency)
    |> fixParams()
    |> handle_response(params)
  end

  defp fixParams({:ok, body}) do
    body = Enum.map(body, fn ({key, value}) -> value end)
    hd body
  end

  defp fixParams({:error, _reason} = error), do: error

  defp handle_response({:ok, body}, params) do
    body
    |> Conversion.build()
    |> create_conversion(params)
  end

  defp handle_response({:error, _msg} = error, _params), do: error

  defp create_conversion(%Conversion{name: name, origin_currency: origin_currency, target_currency: target_currency, origin_value: origin_value, conversion_rate: conversion_rate}, %{
         "user_id" => user_id
       }) do
    params = %{
      name: name,
      origin_currency: origin_currency,
      target_currency: target_currency,
      origin_value: origin_value,
      conversion_rate: conversion_rate,
      user_id: user_id
    }

    params
    |> UserConversion.build()
    |> handle_build()
  end

  defp handle_build({:ok, conversion}), do: Repo.insert(conversion)
  defp handle_build({:error, _changeset} = error), do: error
end
