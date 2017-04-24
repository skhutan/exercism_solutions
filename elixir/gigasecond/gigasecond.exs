defmodule Gigasecond do
	@gigasecond 1_000_000_000
	
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) :: :calendar.datetime

	# def from({{year, month, day}, {hours, minutes, seconds}}) do
    def from(date) do
	   :calendar.datetime_to_gregorian_seconds(date) + @gigasecond
     |> :calendar.gregorian_seconds_to_datetime
  end
end
