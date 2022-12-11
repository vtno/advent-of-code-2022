defmodule Q2Test do
  use ExUnit.Case
  doctest Q2

  describe "run" do
    test "calculate the score correctly based on the rule" do
      assert Q2.run("q2_test_fixture.txt") == 15
    end
  end
end
