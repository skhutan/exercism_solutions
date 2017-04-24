defmodule Roman do
  
  @roman_for %{
    1 => "I", 4 => "IV", 5 => "V", 9 => "IX",
    10 => "X", 40 => "XL", 50 => "L", 90 => "XC",
    100 => "C", 400 => "CD", 500 => "D", 900 => "CM", 1000 => "M"
  }
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    numbers = Map.keys(@roman_for) |> Enum.sort |> Enum.reverse
    convert(number, numbers, "")
  end
  
  defp convert(0, _, roman), do: roman
  defp convert(decimal, [num| number_tail], roman) do
    if(decimal >= num) do
      convert(decimal - num, [num|number_tail], roman <> @roman_for[num])
    else
      convert(decimal, number_tail, roman)
    end
  end
end
