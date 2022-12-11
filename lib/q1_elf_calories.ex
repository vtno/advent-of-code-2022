defmodule Q1ElfCalories do
  @moduledoc """
  Documentation for `Q1ElfCalories`.
  """

  @doc """
  Q1ElfCalories.run() will solve the first question
  """
  def run(file_name \\ "elf_calories.txt") do
    case File.read(file_name) do
      {:ok, data} ->  data
                        |> parse
                        |> Enum.max
    end
  end

  @doc """
  Q1ElfCalories.parse() parse the input txt into a 2d array of each represent all elves baggage
  """
  def parse(data) do
    data
      |> String.split("\n\n", trim: true)
      |> Enum.map(
        &String.split(&1, "\n", trim: true)
          |> Enum.map(fn(cal) -> Integer.parse(cal) |> elem(0) end)
          |> Enum.sum
      )
  end
end
