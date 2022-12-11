defmodule Q2Test do
  use ExUnit.Case
  doctest Q2

  describe "run" do
    test "calculate the score correctly based on the rule of part 1" do
      assert Q2.run("q2_test_fixture.txt", &Q2.get_score(&1)) == 15
    end

    test "calculate the score correctly based on the rule of part 2" do
      assert Q2.run("q2_test_fixture.txt", &Q2.get_score2(&1)) == 12
    end
  end
end
