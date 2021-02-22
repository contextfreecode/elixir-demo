defmodule HiTest do
  use ExUnit.Case
  doctest Hi

  test "greets the world" do
    assert Hi.hello() == :world
  end
end
