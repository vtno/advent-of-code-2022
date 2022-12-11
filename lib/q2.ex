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

  # Part 1
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

  # Part 2
  X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win

  A X = rock + lose = scissors = 3 + 0 = 3
  A Y = rock + draw = rock = 1 + 3 = 4
  A Z = rock + win = paper = 2 + 6 = 8

  B X = paper + lose = rock = 1 + 0 = 1
  B Y = paper + draw = paper = 2 + 3 = 5
  B Z = paper + win = scissors =  3 + 6 = 9

  C X = scissors + lose = paper = 2 + 0 = 2
  C Y = scissors + draw = scissors =  3 + 3 = 6
  C Z = scissors + win = rock = 1 + 6 = 7
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

  @score_2 %{
    "A X" => 3,
    "A Y" => 4,
    "A Z" => 8,
    "B X" => 1,
    "B Y" => 5,
    "B Z" => 9,
    "C X" => 2,
    "C Y" => 6,
    "C Z" => 7
  }

  @doc """
  Q2.run() will solve the second question
  """
  def run(file_name, score_getter) do
    case File.read(file_name) do
      {:ok, data} -> data |> String.split("\n", trim: true) |> Enum.map(score_getter) |> Enum.sum
    end
  end

  def get_score(scenario) do
    @score[scenario]
  end

  def get_score2(scenario) do
    @score_2[scenario]
  end
end
