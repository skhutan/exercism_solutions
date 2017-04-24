defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @open_brackets ["{", "[", "("]
  @close_brackets ["}", "]", ")"]
    
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.codepoints
    |> _check_brackets([])
  end
  
  defp _check_brackets([], []), do: true
  defp _check_brackets([], _), do: false
  defp _check_brackets([h|t], stack) do
    cond do
      Enum.member?(@open_brackets, h) -> _check_brackets(t, [h|stack])
      Enum.member?(@close_brackets, h) ->
        if !Enum.empty?(stack) and matching_bracket?(hd(stack), h) do
           _check_brackets(t, tl(stack))
         else
           false
        end
      true -> _check_brackets(t, stack)
    end
  end
  
  defp matching_bracket?(open_bracket, close_bracket) do
    close_index = get_index(close_bracket, @close_brackets)
    open_index = get_index(open_bracket, @open_brackets)
    open_index === close_index
  end
  
  defp get_index(bracket, list), do: Enum.find_index(list, fn(b) -> b == bracket end)
end
