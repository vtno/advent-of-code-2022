defmodule Q3Test do
  use ExUnit.Case
  doctest Q3

  describe "find_dup" do
    test "correctly find duplicate characters from an input" do
      inputs = [
        "vJrwpWtwJgWrhcsFMMfFFhFp",
        "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
        "PmmdzqPrVvPwwTWBwg",
        "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
        "ttgJtRGJQctTZtZT",
        "CrZsJsPPZsGzwwsLwLmpwMDw"
      ]
      expected = ["p", "L", "P", "v", "t", "s"]

      inputs |> Enum.map(&Q3.find_dup(&1)) |> (& assert(&1 == expected)).()
    end
  end

  describe "run" do
    test "correctly sum the priority of the duplicated item" do
      assert Q3.run("q3_test_fixture.txt") == 157
    end
  end
end
