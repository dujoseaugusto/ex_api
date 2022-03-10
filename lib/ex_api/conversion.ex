defmodule ExApi.Conversion do
  @keys [:name, :code, :codein, :bid]

  @enforce_keys @keys

  @derive Jason.Encoder
  defstruct @keys

  def build(%{"name" => name, "code" => code, "codein" => codein, "bid" => bid}) do
    %__MODULE__{
      name: name,
      code: code,
      codein: codein,
      bid: bid
    }
  end
end
