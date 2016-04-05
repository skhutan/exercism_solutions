defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate(strand, nucleotide)
    Enum.count(strand, &(&1 == nucleotide))
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce(@nucleotides, %{}, fn(nuc, acc) ->
      Map.put(acc, nuc, count(strand, nuc))
    end)
  end
  
  defp validate(strand, nuc) do
    if invalid_strand?(strand) or invalid_nucleotide?(nuc) do
      raise ArgumentError
    end
  end
  
  defp invalid_strand?(strand), do: Enum.any?(strand, &invalid_nucleotide?/1)
  
  defp invalid_nucleotide?(nuc), do: !valid_nucleotide?(nuc)

  defp valid_nucleotide?(nuc), do: Enum.member?(@nucleotides, nuc)
end
