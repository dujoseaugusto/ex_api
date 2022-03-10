defmodule ExApi do
  alias ExApi.{Conversion,User}

  defdelegate create_user(params), to: User.Create, as: :call
  defdelegate delete_user(params), to: User.Delete, as: :call
  defdelegate fetch_user(params), to: User.Get, as: :call
  defdelegate update_user(params), to: User.Update, as: :call

  defdelegate fetch_conversion(params,paramsTwo,user), to: Conversion.Get, as: :call

  ##defdelegate create_user_pokemon(params), to: TrainerPokemon.Create, as: :call
  ##defdelegate delete_user_pokemon(params), to: TrainerPokemon.Delete, as: :call
  ##defdelegate fetch_user_pokemon(params), to: TrainerPokemon.Get, as: :call
  ##defdelegate update_user_pokemon(params), to: TrainerPokemon.Update, as: :call
end
