defmodule Words do
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/[^\w\s-]/u, "")
    |> String.split(~r{\s|_}, trim: true)
    |> count_words
  end

  def count_words(words) do
    Enum.reduce(words, %{}, fn
      (word, acc) -> Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
