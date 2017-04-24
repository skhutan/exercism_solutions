defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    string = normalise(string)
    chunk_size = chunk_size(string)

    string
    |> String.graphemes
    |> Enum.chunk(chunk_size, chunk_size, List.duplicate("", chunk_size))
    |> transpose
    |> Enum.join(" ")
  end

  defp normalise(s) do
    s
    |> String.downcase
    |> String.replace(~r/[\W]/, "")
  end
  
  defp chunk_size(s) do
    s |> String.length |> :math.sqrt |> Float.ceil |> trunc
  end
  
  defp transpose(arr) do
    arr
    |> List.zip
    |> Enum.map(&Tuple.to_list(&1))
  end
end
