defmodule Q1Test do
  use ExUnit.Case
  doctest Q1

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
      assert Q1.parse(data) == [3, 2, 4, 6]
    end
  end

  describe "run" do
    test "find max 3 values from parsed data" do
      assert Q1.run("q1_test_fixture.txt") == 13
    end
  end
end
