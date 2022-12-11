defmodule Q1 do
  @moduledoc """
  Documentation for `Q1`.
  """

  @doc """
  Q1.run() will solve the first question
  """
  def run(file_name \\ "q1.txt") do
    case File.read(file_name) do
      {:ok, data} ->  data
                        |> parse
                        |> Enum.sort
                        |> Enum.take(-3)
                        |> Enum.sum
    end
  end

  @doc """
  Q1.parse() parse the input txt into an array of each represent calories of elf baggage
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
