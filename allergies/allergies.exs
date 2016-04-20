defmodule Allergies do

  @allergens ~w(cats pollen chocolate tomatoes strawberries shellfish peanuts eggs)

  @doc """
  List the allergies for which the corresponding flag bit is true.

  Allergies should be ordered, starting with the allergie with the least
  significant bit ("eggs").
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) do
    generate(flags) |> filter |> Enum.into(MapSet.new)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    list(flags) |> Enum.member?(item)
  end

  defp generate(flags) do
    Integer.digits(flags, 2) |> Enum.reverse |> Enum.zip(Enum.reverse(@allergens))
  end

  defp filter(list) do
    {_, allergies} = list |> Enum.filter(fn({a, _}) -> a == 1 end) |> Enum.unzip
    allergies
  end
end
