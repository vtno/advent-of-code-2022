defmodule Q3 do
  @moduledoc """
  Documentation for `Q3`.
  """

  @priority %{
    "a" => 1,
    "b" => 2,
    "c" => 3,
    "d" => 4,
    "e" => 5,
    "f" => 6,
    "g" => 7,
    "h" => 8,
    "i" => 9,
    "j" => 10,
    "k" => 11,
    "l" => 12,
    "m" => 13,
    "n" => 14,
    "o" => 15,
    "p" => 16,
    "q" => 17,
    "r" => 18,
    "s" => 19,
    "t" => 20,
    "u" => 21,
    "v" => 22,
    "w" => 23,
    "x" => 24,
    "y" => 25,
    "z" => 26,
    "A" => 27,
    "B" => 28,
    "C" => 29,
    "D" => 30,
    "E" => 31,
    "F" => 32,
    "G" => 33,
    "H" => 34,
    "I" => 35,
    "J" => 36,
    "K" => 37,
    "L" => 38,
    "M" => 39,
    "N" => 40,
    "O" => 41,
    "P" => 42,
    "Q" => 43,
    "R" => 44,
    "S" => 45,
    "T" => 46,
    "U" => 47,
    "V" => 48,
    "W" => 49,
    "X" => 50,
    "Y" => 51,
    "Z" => 52,
  }

  @doc """
  Q3.run will solve question 3
  """
  def run(file_name \\ "q3.txt") do
    case File.read(file_name) do
      {:ok, data} -> data |> String.split("\n", trim: true) |> Enum.map(&find_dup(&1)) |> Enum.map(&get_priority(&1)) |> Enum.sum
    end
  end

  def find_dup(input) do
    head = input |> String.slice(0..div(String.length(input) - 1, 2)) |> String.split("", trim: true)
    tail = input |> String.slice(div(String.length(input), 2)..String.length(input)) |> String.split("", trim: true)
    MapSet.intersection(MapSet.new(head), MapSet.new(tail))
    |> MapSet.to_list
    |> List.first
  end

  defp get_priority(char) do
    @priority[char]
  end
end
