defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    transcriptor = %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}
    Enum.map(dna, &(transcriptor[&1]))
  end
end
