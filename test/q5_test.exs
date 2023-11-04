defmodule Q5Test do
  use ExUnit.Case
  doctest Q5

  describe "parseline" do
    test "correctly parse valid line" do
      line = ~S"""
move 3 from 1 to 2
"""
      [move, from, to] = Q5.parseline(line)
      assert move == 3
      assert from == 1
      assert to == 2
    end
  end

  describe "run" do
    test "should solve sample problem" do
      assert Q5.run("q5_test_fixture.txt") == "CMZ"
    end

    test "should solve actual problem" do
      assert Q5.run("q5.txt", false) == "GRTSWNJHH"
    end
  end
end
