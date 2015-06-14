defmodule Reader do
    def tokenize(str) do
        tokenize_regex = ~r/[\s,]*(~@|[\[\]{}()'`~^@]|"(?:\\.|[^\\"])*"|;.*|[^\s\[\]{}('"`,;)]*)/
        Enum.filter(
            Enum.map(
                Regex.scan(tokenize_regex, str), 
                fn(x) -> String.strip(List.first x) end),
            fn(x) -> String.length(x) > 0 end)
    end
end
