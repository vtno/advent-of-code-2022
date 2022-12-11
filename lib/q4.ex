defmodule Q4 do
  @moduledoc """
  Documentation for `Q4`.
  """

  @doc """
  Q4.run will solve question 4 part 1
  """
  def run(file_name \\ "q4.txt") do
    case File.read(file_name) do
      {:ok, data} ->
        data
        |> String.split("\n", trim: true)
        |> Enum.map(&String.split(&1, ","))
        |> Enum.map(&compare(Enum.at(&1, 0), Enum.at(&1, 1)))
        |> Enum.count(fn list -> length(list) == 0 end)
    end
  end

  @doc """
  Q4.to_list() converts pair of input into a list of the provided range
  e.g. 1-4 will become [1, 2, 3, 4]
  """
  def to_list(input) do
    [starting, ending] = input
    |> String.split("-", trim: true)
    |> Enum.map(&Integer.parse(&1))
    |> Enum.map(&elem(&1, 0))
    Enum.to_list(starting..ending)
  end

  @doc """
  Q4.compare() returns a subtraction of a list depending on the size.
  The smaller one will be subtracted by the larger one which resulted
  in an empty list if it is fully covered.
  """
  def compare(src, target) do
    src_list = to_list(src)
    target_list = to_list(target)
    cond do
      length(src_list) >= length(target_list) -> target_list -- src_list
      length(src_list) < length(target_list) ->  src_list -- target_list
    end
  end
end
