defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(subject, candidates) do
    Enum.filter(candidates, fn (candidate) ->
      sort(subject) == sort(candidate)
      and String.downcase(subject) !== String.downcase(candidate)
    end)
  end
  
  defp sort(string) do
    string
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
  end
end
