defmodule DNA do
  @transcriptor %{G: "C", C: "G", T: "A", A: "U"}
  
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> List.to_string
    |> String.graphemes
    |> Enum.reduce("", &build_rna/2)
    |> String.to_char_list
  end
  
  defp build_rna(nuc, acc), do: acc <> @transcriptor[String.to_atom(nuc)]
end
