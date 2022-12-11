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
    test "return 1 if range is fully covered when partial option is false" do
      inputs = [
        ["1-3", "2-4"],
        ["1-3", "4-5"],
        ["1-3", "1-1"],
        ["1-1", "1-3"],
        ["1-1", "1-1"]
      ]

      expected = [
        0,
        0,
        1,
        1,
        1
      ]

      inputs
      |> Enum.map(&Q4.compare(Enum.at(&1, 0), Enum.at(&1, 1)))
      |> (&assert(&1 == expected)).()
    end

    test "return 1 if range is fully covered when partial option is true" do
      inputs = [
        ["1-3", "2-4"],
        ["1-3", "4-5"],
        ["1-3", "1-1"],
        ["1-1", "1-3"],
        ["1-1", "1-1"]
      ]

      expected = [
        1,
        0,
        1,
        1,
        1
      ]

      inputs
      |> Enum.map(&Q4.compare(Enum.at(&1, 0), Enum.at(&1, 1), true))
      |> (&assert(&1 == expected)).()
    end
  end

  describe "run" do
    test "count number of fully covered pair of ranges" do
      assert Q4.run("q4_test_fixture.txt") == 2
    end

    test "count number of partially covered pair of ranges" do
      assert Q4.run("q4_test_fixture.txt", true) == 4
    end
  end
end
