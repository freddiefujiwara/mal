defmodule ReaderTest do
  use ExUnit.Case

  test "Reader.tokenize" do
    reader = %{:tokens => [], :position => 0}

    reader = Reader.tokenize(reader,"str")
    assert reader.tokens == ["str"]

    reader = Reader.tokenize(reader,"(str)")
    assert reader.tokens == ["(","str",")"]

    reader = Reader.tokenize(reader,"(+ 1 (* 2 3))")
    assert reader.tokens == ["(","+","1","(","*","2","3",")",")"]
  end
  test "Reader.next and Reader.peek" do
    reader = %{:tokens => [], :position => 0}

    reader = Reader.tokenize(reader,"(+ 1 (* 2 3))")

    {reader,word} = Reader.peek(reader)
    assert word == "("
    assert reader.position == 0
    {reader,word} = Reader.next(reader)
    assert word == "("
    assert reader.position == 1
    {reader,word} = Reader.peek(reader)
    assert word == "+"
    assert reader.position == 1

    {reader,_} = Reader.next(reader)
    {reader,_} = Reader.next(reader)
    {reader,_} = Reader.next(reader)
    {reader,_} = Reader.next(reader)
    {reader,_} = Reader.next(reader)
    {reader,_} = Reader.next(reader)
    {reader,_} = Reader.next(reader)

    {reader,word} = Reader.peek(reader)
    assert word == ")"
    assert reader.position == 8
    {reader,word} = Reader.next(reader)
    assert word == ")"
    assert reader.position == 9
    {reader,word} = Reader.peek(reader)
    assert word == nil
    assert reader.position == 9

    {reader,word} = Reader.next(reader)
    assert word == nil
    assert reader.position == 9
  end
end
