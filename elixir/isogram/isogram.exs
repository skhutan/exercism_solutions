defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sanitised = sentence |> String.replace(~r/[\s-]/, "")
    sanitised |> String.to_charlist |> Enum.uniq |> length == String.length(sanitised)
  end
end
