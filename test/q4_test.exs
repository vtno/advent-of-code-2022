defmodule Q4Test do
  use ExUnit.Case
  doctest Q4

  describe "to_list" do
    test "converts range in 1-10 format into list" do
      inputs = [
        "1-3",
        "1-1",
        "8-10"
      ]

      expected = [
        [1, 2, 3],
        [1],
        [8, 9, 10]
      ]

      inputs |> Enum.map(&Q4.to_list(&1)) |> (&assert(&1 == expected)).()
    end
  end

  describe "compare" do
    test "subtract two list by using the larger one" do
      inputs = [
        ["1-3", "2-4"],
        ["1-3", "4-5"],
        ["1-3", "1-1"],
        ["1-1", "1-3"],
        ["1-1", "1-1"]
      ]

      expected = [
        [4],
        [4, 5],
        [],
        [],
        []
      ]

      inputs
      |> Enum.map(&Q4.compare(Enum.at(&1, 0), Enum.at(&1, 1)))
      |> (&assert(&1 == expected)).()
    end
  end

  describe "run" do
    test "count number of fully covered pair of ranges" do
      assert Q4.run("q4_test_fixture.txt") == 2
    end
  end
end
