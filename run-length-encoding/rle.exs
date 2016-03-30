defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.split("", trim: true)
    |> Enum.reduce("", fn(letter, acc) ->
      if String.last(acc) === letter do
        
        #get last number by regex
        re = ~r/(\d+)[A-Z]$/
        encode_number = Regex.run(re, acc, capture: :all_but_first) |> List.first
        Regex.replace(re, acc, increment_encoding(encode_number) <> letter)
      else
        acc <> "1" <> letter
      end
      end)
  end
  
  defp increment_encoding(encode_number) do
    Integer.to_string(String.to_integer(encode_number) + 1)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do

  end
end
