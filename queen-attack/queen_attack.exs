defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new(nil | list) :: Queens.t()
  def new(white \\ {0, 3}, black \\ {7, 3}) do
    cond do
      white == black -> raise ArgumentError
      true -> %Queens{white: white, black: black}
    end
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    create_board(queens)
    |> Enum.reduce("", &(&2 <> Enum.join(&1, " ") <> "\n"))
    |> String.replace_suffix("\n", "")
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(queens) do
    {white_row, white_col} = queens.white
    {black_row, black_col} = queens.black
    
    cond do
      white_row == black_row
      or white_col == black_col
      or abs(white_row - black_row) == abs(white_col - black_col) -> true
      true -> false
    end
  end
  
  defp create_board(queens) do
    {white_row, white_col} = queens.white
    {black_row, black_col} = queens.black
    
    0..7
    |> Enum.map(fn row ->
        list = List.duplicate("_", 8)
        cond do
          white_row == row -> List.replace_at(list, white_col, "W")
          black_row == row -> List.replace_at(list, black_col, "B")
          true -> list
        end
      end)
  end
  
  defp diagonal_attack?(queens) do
    diagonal_moves(queens.white)
    |> Enum.any?(&(&1 == queens.black))
  end
end
