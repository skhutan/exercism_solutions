defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/[^\w\s]/u, "")
    |> String.split
    |> Enum.reduce("", fn(word, acc) ->
        first_letter = word |> String.capitalize |> String.first
        other_capital_letters = word |> String.split("") |> tl |> get_other_capital_letters
        acc <> first_letter <> other_capital_letters
      end)
  end
  
  defp get_other_capital_letters(letters) do
    Enum.reduce(letters, "", fn(letter, acc) ->
      cond do
        is_capitalised?(letter) -> acc <> letter
        true -> acc
      end
    end)
  end
  
  defp is_capitalised?(letter) do
    letter === String.upcase(letter)
  end
end
