defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b)
  when length(digits) == 0 or base_a < 2 or base_b < 2, do: nil

  def convert(digits, base_a, base_b) do
    case to_number(digits, base_a, 0) do
      {:ok, number} -> to_digits(number, base_b, [])
      {:error, error} -> error
    end
  end

  defp to_number([], _, acc), do: {:ok, acc}
  defp to_number([h|_], b, _) when h < 0 or h == b, do: {:error, nil}
  defp to_number([h|t], base, acc), do: to_number(t, base, base * acc + h)

  defp to_digits(n, base, acc) when n > 0 do
    to_digits(Integer.floor_div(n, base), base, [rem(n, base)] ++ acc)
  end
  defp to_digits(0, _, acc) when length(acc) == 0, do: [0]
  defp to_digits(0, _, acc), do: acc
end
