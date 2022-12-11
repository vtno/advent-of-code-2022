defmodule Q1ElfCaloriesTest do
  use ExUnit.Case
  doctest Q1ElfCalories

  describe "parse" do
    test "correctly parses input file into array format" do
      data = ~S"""
1
2

1
1

1
1
1
1

1
5
"""
      assert Q1ElfCalories.parse(data) == [3, 2, 4, 6]
    end
  end

  describe "run" do
    test "find max value from parsed data" do
      assert Q1ElfCalories.run("q1_elf_calories_test_fixture.txt") == 6
    end
  end
end
