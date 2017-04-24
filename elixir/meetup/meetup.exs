defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @weekdays %{monday: 1, tuesday: 2, wednesday: 3, thursday: 4,
            friday: 5, saturday: 6, sunday: 7}
            
  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    days(schedule)
    |> Enum.map(&({year, month, &1}))
    |> Enum.filter(&:calendar.valid_date/1)
    |> Enum.find(&(:calendar.day_of_the_week(&1) == @weekdays[weekday]))
  end
  
 defp days(schedule) do
   case schedule do
      :first -> 1..7
      :second -> 8..14
      :third -> 15..21
      :fourth -> 22..28
      :last -> 31..22
      :teenth -> 13..19
   end
  end
end
