defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      contains?(a, b) -> :superlist
      contains?(b, a) -> :sublist
      true -> :unequal
    end
  end
  
  defp contains?(superlist, sublist) do
    sublist_count = Enum.count(sublist)
    superlist_count = Enum.count(superlist)
    cond do
      sublist_count > superlist_count -> false
      Enum.take(superlist, sublist_count) === sublist ->
        true
      true ->
        [_|superlist_tail] = superlist
        contains?(superlist_tail, sublist)
    end
  end
end
