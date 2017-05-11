defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t

  @parts %{
    0 => ["no more", "99", "Go to the store", "buy some more"],
    1 => ["1", "no more", "Take it down", "pass it around"],
    :other => ["Take one down", "pass it around"]
  }

  def verse(0), do: get_verse(@parts[0])
  def verse(1), do: get_verse(@parts[1])
  def verse(number) do
    [Integer.to_string(number), Integer.to_string(number-1)] ++ @parts[:other]
    |> get_verse
  end

  defp get_verse([n, next, action_1, action_2]) do
    """
    #{String.capitalize(n)} #{bottles(n)} of beer on the wall, #{n} #{bottles(n)} of beer.
    #{action_1} and #{action_2}, #{next} #{bottles(next)} of beer on the wall.
    """
  end

  defp bottles("1"), do: "bottle"
  defp bottles(_), do: "bottles"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics, do: get_lyrics(99..0)
  def lyrics(range), do: get_lyrics(range)

  defp get_lyrics(range) do
    Enum.to_list(range)
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end
end
