defmodule SecretHandshake do
  use Bitwise

  @command_list [
    {1, "wink"},
    {2, "double blink"},
    {4, "close your eyes"},
    {8, "jump"}
  ]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    @command_list
    |> Enum.filter_map(
        fn({c, _}) -> match_bits(code, c) end,
        fn({_, command}) -> command end
      )
    |> reverse_if_necessary(code)
  end

  defp match_bits(code, other_code) do
    (code &&& other_code) > 0
  end

  defp reverse?(code) do
     match_bits(code, 16)
  end

  defp reverse_if_necessary(list, code) do
    cond do
      reverse?(code) -> Enum.reverse(list)
      true -> list
    end
  end

end
