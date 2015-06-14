defmodule ReaderTest do
  use ExUnit.Case

  test "READ" do
    assert Reader.tokenize("str") == ["str"]
    assert Reader.tokenize("(str)") == ["(","str",")"]
    assert Reader.tokenize("(+ 1 (* 2 3))") == ["(","+","1","(","*","2","3",")",")"]
  end
end
