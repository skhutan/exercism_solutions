defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    rna
    |> String.graphemes
    |> Enum.chunk(3)
    |> Enum.map(&List.to_string/1)
    |> Enum.reduce_while({:ok, []}, fn codon, {_, acc} ->
      case of_codon(codon) do
        {:ok, "STOP"} -> {:halt, {:ok, acc}}
        {:ok, text} -> {:cont, {:ok, acc ++ [text]}}
        {:error, _} -> {:halt, {:error, "invalid RNA"}}
      end
    end)
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    case codon do
      "UGU" -> { :ok, "Cysteine" }
      "UGC" -> { :ok, "Cysteine" }
      "UUA" -> { :ok, "Leucine" }
      "UUG" -> { :ok, "Leucine" }
      "AUG" -> { :ok, "Methionine" }
      "UUU" -> { :ok, "Phenylalanine"}
      "UUC" -> { :ok, "Phenylalanine"}
      "UCU" -> { :ok, "Serine" }
      "UCC" -> { :ok, "Serine" }
      "UCA" -> { :ok, "Serine" }
      "UCG" -> { :ok, "Serine" }
      "UGG" -> { :ok, "Tryptophan" }
      "UAU" -> { :ok, "Tyrosine" }
      "UAC" -> { :ok, "Tyrosine" }
      "UAA" -> { :ok, "STOP" }
      "UAG" -> { :ok, "STOP" }
      "UGA" -> { :ok, "STOP" }
      _ -> { :error, "invalid codon"}
    end
  end
end
