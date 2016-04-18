defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    numbers = 2..limit
    |> Enum.to_list
    |> primes
  end
  
  defp primes([]), do: []
  defp primes([h|t]) do
    [h | primes(Enum.reject(t, fn x -> rem(x, h) == 0 end))]
  end
end
