defmodule Q5 do
  @moduledoc """
  Documetation for Q5
  """

  # [N] [G]                     [Q]
  # [H] [B]         [B] [R]     [H]
  # [S] [N]     [Q] [M] [T]     [Z]
  # [J] [T]     [R] [V] [H]     [R] [S]
  # [F] [Q]     [W] [T] [V] [J] [V] [M]
  # [W] [P] [V] [S] [F] [B] [Q] [J] [H]
  # [T] [R] [Q] [B] [D] [D] [B] [N] [N]
  # [D] [H] [L] [N] [N] [M] [D] [D] [B]

  @input_stacks [
    Stack.new(["N", "H", "S", "J", "F", "W", "T", "D"]),
    Stack.new(["G", "B", "N", "T", "Q", "P", "R", "H"]),
    Stack.new(["V", "Q", "L"]),
    Stack.new(["Q", "R", "W", "S", "B", "N"]),
    Stack.new(["B", "M", "V", "T", "F", "D", "N"]),
    Stack.new(["R", "T", "H", "V", "B", "D", "M"]),
    Stack.new(["J", "Q", "B", "D"]),
    Stack.new(["Q", "H", "Z", "R", "V", "J", "N", "D"]),
    Stack.new(["S", "M", "H", "N", "B"])
  ]

  @sample_input_stacks [
    Stack.new(["N", "Z"]),
    Stack.new(["D", "C", "M"]),
    Stack.new(["P"])
  ]

  @doc """
  Q5.run will solve question 5
  """
  def run(file_name \\ "q5.txt", is_sample \\ true) do
    initial_stacks =
      if is_sample do
        @sample_input_stacks
      else
        @input_stacks
      end

    instructions =
      with {:ok, data} <- File.read(file_name) do
        data
        |> String.split("\n", trim: true)
        |> Enum.map(&parseline/1)
      end

    instructions
      |> Enum.reduce(initial_stacks, fn ([move, from, to], curr_stacks) ->
        for _ <- 1..move, reduce: curr_stacks do
          stacks ->
            move(stacks, [from, to])
        end
      end)
      |> Enum.reduce("", fn stack, acc -> acc <> Stack.peek(stack) end)
  end

  def parseline(line) do
    [_, move, _, from, _, to] =
      line
      |> String.split(" ", trim: true)

    [{move, _}, {from, _}, {to, _}] =
      [move, from, to]
      |> Enum.map(&Integer.parse/1)

    [move, from, to]
  end

  def move(curr_stacks, [from, to]) do
    from_index = from - 1
    to_index = to - 1
    {:ok, elem, updated_from} = Enum.at(curr_stacks, from_index) |> Stack.pop
    updated_to = Enum.at(curr_stacks, to_index) |> Stack.push(elem)
    curr_stacks |> Enum.with_index |> Enum.map(fn ({stack, index}) ->
      case index do
        ^from_index -> updated_from
        ^to_index -> updated_to
        _ -> stack
      end
    end)
  end
end
