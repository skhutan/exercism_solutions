defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    coins = values |> Enum.sort |> Enum.reverse
    get_change(amount, coins)
  end
  
  defp get_change(amount, coins) do
    acc = for i <- coins, do:  {i, 0}, into: %{}
    get_change(amount, coins, acc)
  end
  defp get_change(0, _, acc), do: {:ok, acc}
  defp get_change(_, [], _), do: :error
  defp get_change(amount, [h|t], acc) do
    new_amount = amount - h
    cond do
      new_amount >= 0 -> get_change(new_amount, [h|t], Map.update(acc, h, 1, &(&1 + 1)))
      true -> get_change(amount, t, acc)
    end
  end
end
