defmodule Pangram do
  @alphabet ?a..?z |> Enum.to_list |> List.to_string |> String.graphemes
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    Enum.all?(@alphabet, fn(letter) -> String.contains?(sentence |> String.downcase, letter) end)
  end
end
