defmodule Tournament do
  @win %{mp: 1, w: 1, d: 0, l: 0, p: 3}
  @draw %{mp: 1, w: 0, d: 1, l: 0, p: 1}
  @loss %{mp: 1, w: 0, d: 0, l: 1, p: 0}

  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    input
    |> Enum.reduce(%{}, &score_match/2)
    |> sort_scores
    |> build_table
  end

  defp score_match(match, acc) do
    parts = String.split(match, ";")
    cond do
      Regex.run(~r/[^a-z;\s]/i, match) -> acc
      length(parts) != 3 -> acc
      true -> calc_scores(parts, acc)
    end
  end

  defp calc_scores([team1, team2, result], acc) do
    case result do
      "win" -> update_team(acc, team1, @win) |> update_team(team2, @loss)
      "draw" -> update_team(acc, team1, @draw) |> update_team(team2, @draw)
      "loss" -> update_team(acc, team1, @loss) |> update_team(team2, @win)
      _ -> acc
    end
  end

  defp update_team(score_map, team, match_score) do
    sum_scores = fn(_, v1, v2) -> v1 + v2 end
    Map.update(score_map, team, match_score, &(Map.merge(&1, match_score, sum_scores)))
  end

  defp sort_scores(scores) do
     Enum.sort(scores, fn({_, score1}, {_, score2}) -> score1.p >= score2.p end)
  end

  defp build_table(scores) do
    ["Team                           | MP |  W |  D |  L |  P"]
    ++ Enum.map(scores, &row/1)
    |> Enum.join("\n")
  end

  defp row({team, score}) do
    "#{String.pad_trailing(team, 31)}|  #{score.mp} |  #{score.w} |  #{score.d} |  #{score.l} |  #{score.p}"
  end
end
