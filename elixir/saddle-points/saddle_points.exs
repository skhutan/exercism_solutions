defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    String.split(str, "\n")
    |> Enum.map(fn row ->
        String.split(row) |> Enum.map(&(String.to_integer(&1)))
      end)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    rows(str)
    |> List.zip
    |> Enum.map(&Tuple.to_list(&1))
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    rows = rows(str)
    cols = columns(str)
    
    for {row, i} <- Enum.with_index(rows),
        {col, j} <- Enum.with_index(cols),
        Enum.max(row) == Enum.at(row, j),
        Enum.min(col) == Enum.at(row, j),
        do: {i, j}
  end
end
