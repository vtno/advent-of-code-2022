defmodule Q4 do
  @moduledoc """
  Documentation for `Q4`.
  """

  @doc """
  Q4.run will solve question 4
  """
  def run(file_name \\ "q4.txt", partial? \\ false) do
    case File.read(file_name) do
      {:ok, data} ->
        data
        |> String.split("\n", trim: true)
        |> Enum.map(&String.split(&1, ","))
        |> Enum.map(&compare(Enum.at(&1, 0), Enum.at(&1, 1), partial?))
        |> Enum.sum
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
  def compare(src, target, partial? \\ false) do
    src_list = to_list(src)
    target_list = to_list(target)
    cond do
      length(src_list) >= length(target_list) ->
        compute_compare_result(target_list -- src_list, target_list, partial?)
      length(src_list) < length(target_list) ->
        compute_compare_result(src_list -- target_list, src_list, partial?)
    end
  end

  defp compute_compare_result(result, subtracted_list, partial?) do
    if length(result) == 0 do
      1
    else
      compute_partial_compare_result(result, subtracted_list, partial?)
    end
  end

  defp compute_partial_compare_result(result, subtracted_list, partial?) do
    # if partial? option is provided check if the subtraction resulted in the same
    # list as the subtrahend which means nothing was subtracted
    if partial? && result != subtracted_list do
      1
    else
      0
    end
  end
end
