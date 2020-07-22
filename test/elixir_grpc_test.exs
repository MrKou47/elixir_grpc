defmodule ElixirGrpcTest do
  use ExUnit.Case
  doctest ElixirGrpc

  test "greets the world" do
    assert ElixirGrpc.hello() == :world
  end
end
