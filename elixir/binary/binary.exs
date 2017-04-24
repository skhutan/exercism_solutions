defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    try do
      string
      |> String.to_integer
      |> Integer.digits
      |> convert(0)
    rescue _ -> 0
    end
  end
  
  defp convert([], acc), do: acc
  defp convert([1|t], acc), do: convert(t, acc + :math.pow(2, length(t)))
  defp convert([0|t], acc), do: convert(t, acc)
end
