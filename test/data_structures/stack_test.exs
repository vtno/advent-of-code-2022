defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  describe "new" do
    test "initialize an empty stack" do
      assert Stack.new().data == []
    end

    test "initialize a non empty stack" do
      assert Stack.new([1, 2]).data == [1, 2]
    end
  end

  describe "pop" do
    test "correctly pop data out of the stack" do
      {:ok, elem, stack} =
        Stack.new([1, 2, 3, 4])
        |> Stack.pop()

      assert elem == 1
      assert stack.data == [2, 3, 4]
    end

    test "return error when stack is empty" do
      {:error, msg} = Stack.new() |> Stack.pop()
      assert msg == "Stack is empty"
    end
  end

  describe "push" do
    test "push data to the top of the stack" do
      stack =
        Stack.new([1, 2, 3, 4])
        |> Stack.push(0)

        assert stack.data == [0, 1, 2, 3, 4]
    end
  end

  describe "peek" do
    test "return top item from the stack" do
      assert Stack.new([1, 2, 3, 4]) |> Stack.peek == 1
    end
  end
end
