defmodule PigLatin do
  @vowels ~w(a e i o u yt xr)
  @special_consonants ~w(ch qu th thr)

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split
    |> Enum.map(&handle_prefixes/1)
    |> Enum.join(" ")
  end

  defp handle_prefixes(phrase) do
    cond do
      special_consonant?(phrase)
        -> String.split_at(phrase, special_consonant_length(phrase))
      String.starts_with?(phrase, @vowels) -> {phrase, ""}
      !String.starts_with?(phrase, @vowels) && String.slice(phrase, 1..-1) |> special_consonant?
        -> String.split_at(phrase, 3)
      true -> String.split_at(phrase, 1)
    end
    |> ay
  end

  defp special_consonant_length(phrase) do
    Enum.filter(@special_consonants, fn(x) -> String.starts_with?(phrase, x) end)
    |> Enum.map(&String.length/1)
    |> Enum.max
  end

  defp special_consonant?(phrase) do
    String.starts_with?(phrase, @special_consonants)
  end

  defp ay({prefix, suffix}) do
    "#{suffix}#{prefix}ay"
  end

end
