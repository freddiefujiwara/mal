defmodule Reader do
    def peek(obj) do
        word = Enum.at obj.tokens, obj.position
        if word == nil do
            {obj,nil}
        else
            {obj,word}
        end
    end
    def next(obj) do
        word = Enum.at obj.tokens, obj.position
        if word == nil do
            {obj,nil}
        else
            {Dict.put(obj, :position, obj.position + 1),word}
        end
    end
    def tokenize(obj,str) do
        tokenize_regex = ~r/[\s,]*(~@|[\[\]{}()'`~^@]|"(?:\\.|[^\\"])*"|;.*|[^\s\[\]{}('"`,;)]*)/
        obj = Dict.put(obj, :tokens, Enum.filter(
            Enum.map(
                Regex.scan(tokenize_regex, str), 
                fn(x) -> String.strip(List.first x) end),#["  token ","  token "] to "token"
            fn(x) -> String.length(x) > 0 end)           #no empty
        )
        obj
    end
end
