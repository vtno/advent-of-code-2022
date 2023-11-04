defmodule Stack do
  @moduledoc """
  Stack implement stack data structure (LIFO)
  """

  defstruct data: []

  def new(), do: %Stack{}
  def new(data = [_head|_tail]), do: %Stack{data: data}

  @doc"""
  pop/1 removes the top element from the stack and returns it
  """
  def pop(%Stack{data: [head | tail]}) do
    {:ok, head, %Stack{data: tail}}
  end
  def pop(%Stack{}), do: {:error, "Stack is empty"}


  @doc """
  push/2 add an element to the top of the stack
  """
  def push(stack, element) do
    %Stack{data: [element | stack.data]}
  end
end
