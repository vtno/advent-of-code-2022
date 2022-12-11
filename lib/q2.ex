defmodule Q2 do
  @moduledoc """
  Documentation for `Q2`.

  Encryption rule

  Enemy
  A for Rock, B for Paper, and C for Scissors

  Self
  X for Rock, Y for Paper, and Z for Scissors

  Shape score
  1 for Rock, 2 for Paper, and 3 for Scissors

  Round score
  0 if you lost, 3 if the round was a draw, and 6 if you won

  Pair

  A X = draw + rock = 3 + 1 = 4
  A Y = win + paper = 6 + 2 = 8
  A Z = lose + scissors = 0 + 3 = 3

  B X = lose + rock = 0 + 1 = 1
  B Y = draw + paper = 3 + 2 = 5
  B Z = win + scissors = 6 + 3 = 9

  C X = win + rock = 6 + 1 = 7
  C Y = lose + paper = 0 + 2 = 2
  C Z = draw + scissors = 3 + 3 = 6
  """

  @score %{
    "A X" => 4,
    "A Y" => 8,
    "A Z" => 3,
    "B X" => 1,
    "B Y" => 5,
    "B Z" => 9,
    "C X" => 7,
    "C Y" => 2,
    "C Z" => 6
  }

  @doc """
  Q2.run() will solve the second question
  """
  def run(file_name \\ "q2.txt") do
    case File.read(file_name) do
      {:ok, data} -> data |> String.split("\n", trim: true) |> Enum.map(&get_score(&1)) |> Enum.sum
    end
  end

  defp get_score(scenario) do
    @score[scenario]
  end
end
