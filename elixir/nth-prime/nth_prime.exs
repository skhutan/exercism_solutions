defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  def nth(count) when count < 1, do: raise :error
  def nth(count) do
    Stream.iterate(2, &next_prime/1)
    |> Stream.take(count)
    |> Enum.at(count - 1)
  end

  def next_prime(prev) do
    next = prev + 1

    if prime?(next, 2) do
       next
     else
       next_prime(next)
    end
  end

  def prime?(next, factor) when factor > next / 2, do: true
  def prime?(next, factor) when rem(next, factor) == 0, do: false
  def prime?(next, factor), do: prime?(next, factor + 1)
end
