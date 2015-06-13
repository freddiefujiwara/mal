defmodule ElixirTest do
  use ExUnit.Case

  test "READ" do
    assert Step0_Repl.read('str') == 'str'
  end
  test "EVAL" do
    assert Step0_Repl.eval('ast','env') == 'ast'
  end
  test "PRINT" do
    assert Step0_Repl.print('exp') == 'exp'
  end
  test "REPL" do
    assert Step0_Repl.repl('exp') == 'exp'
  end
end
