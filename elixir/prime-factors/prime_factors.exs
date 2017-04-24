defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(n), do: factors(n, 2, [])
  
  defp factors(n, _, factors) when n < 2, do: Enum.reverse(factors)
  defp factors(n, p, factors) do
    if(rem(n, p) == 0) do
      factors(div(n, p), p, [p| factors])
    else
      factors(n, p+1, factors)
    end
  end
end
