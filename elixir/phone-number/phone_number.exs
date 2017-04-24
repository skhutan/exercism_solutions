defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> String.replace(~r/[^\w]/, "")
    |> verify_number
  end
  
  defp verify_number(n) do
    cond do
      valid_11_digits?(n) -> String.slice(n, 1..-1)
      valid_10_digits?(n) -> n
      true -> "0000000000"
    end
  end
  
  defp valid_11_digits?(n) do
    String.length(n) == 11 and String.first(n) == "1"
  end
  
  defp valid_10_digits?(n), do: String.length(n) == 10

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw), do: String.slice(number(raw), 0..2)
  
  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    full_number = number(raw)
    area_code = area_code(full_number)
    prefix = String.slice(full_number, 3..5)
    subscriber = String.slice(full_number, 6..-1)
    "(#{area_code}) #{prefix}-#{subscriber}"
  end
end
