defmodule Atbash do
  @alphabet "abcdefghijklmnopqrstuvwxyz"
  @alphabet_map Enum.with_index(String.graphemes(@alphabet)) |> Enum.into(%{})
  
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> String.downcase
    |> String.replace(~r/[^\w]/, "")
    |> String.graphemes
    |> Enum.map(&reverse_letter/1)
    |> Enum.chunk(5, 5, [])
    |> Enum.join(" ")
  end
  
  defp reverse_letter(l) do
    index = @alphabet_map[l]
    case index do
      nil -> l
      index -> String.at(@alphabet, String.length(@alphabet) - index - 1)
    end
  end
end
