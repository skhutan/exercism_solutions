defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: _count(l, 0)
  
  defp _count([], acc), do: acc
  defp _count([h|t], acc), do: _count(t, acc+1)

  @spec reverse(list) :: list
  def reverse(l), do: _reverse(l, [])
  
  defp _reverse([], acc), do: acc
  defp _reverse([h|t], acc), do: _reverse(t, [h|acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: _map(l, f, [])

  defp _map([], f, acc), do: reverse(acc)
  defp _map([h|t], f, acc), do: _map(t, f, [f.(h) | acc])


  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: _filter(l, f, [])
  
  defp _filter([], f, acc), do: reverse(acc)
  defp _filter([h|t], f, acc) do
    if f.(h) do
      _filter(t, f, [h | acc])
    else
      _filter(t, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do

  end
  
  

  @spec append(list, list) :: list
  def append(a, b) do

  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
