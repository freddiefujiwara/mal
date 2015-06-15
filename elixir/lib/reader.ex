defmodule Reader do
    def read_atom(obj) do
        {obj,token} = next obj
        if Regex.match? ~r/^-?[0-9]+$/, token do
            String.to_integer token , 10
        end
    end
    def peek(obj) do
        {obj,Enum.at(obj.tokens, obj.position)}
    end

    def next(obj) do
        {obj,word} = peek obj
        unless word == nil do
            {obj,word} = 
                {Dict.put(obj, :position , obj.position + 1),word}
        end
        {obj,word}
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
