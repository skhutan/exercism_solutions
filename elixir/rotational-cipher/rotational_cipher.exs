defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  def rotate(text, shift) do
    for <<char <- text>>, into: "", do: <<rotate_char(char, shift)>>
  end

  defp rotate_char(char, shift) when char in ?a..?z, do: ?a + rem(char + shift - ?a , 26)
  defp rotate_char(char, shift) when char in ?A..?Z, do: ?A + rem(char + shift - ?A , 26)
  defp rotate_char(char, _), do: char

end
