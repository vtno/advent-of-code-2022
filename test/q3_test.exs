defmodule Q3Test do
  use ExUnit.Case
  doctest Q3

  describe "find_dup/2" do
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

  describe "find_dup/3" do
    test "find duplicated character in the input strings" do
      inputs = [
        "vJrwpWtwJgWrhcsFMMfFFhFp",
        "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
        "PmmdzqPrVvPwwTWBwg",
      ]
     assert Q3.find_dup(Enum.at(inputs, 0), Enum.at(inputs, 1), Enum.at(inputs, 2)) == "r"
    end
  end

  describe "run2" do
    test "correctly sum the priority of the duplicated item of each slice of 3 elves" do
      assert Q3.run2("q3_test_fixture.txt") == 70
    end
  end
end
