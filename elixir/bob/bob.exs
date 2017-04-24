defmodule Bob do
  def hey(input) do
    cond do
      question?(input) -> "Sure."
      silent?(input) -> "Fine. Be that way!"
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
  
  defp silent?(input) do
    String.strip(input) |> String.length == 0
  end
  
  defp shouting?(input) do
    String.upcase(input) == input and String.downcase(input) != input
  end
  
  defp question?(input) do
    String.ends_with?(input, "?")
  end
end
