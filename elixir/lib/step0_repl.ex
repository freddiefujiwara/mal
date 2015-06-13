defmodule Step0_Repl do
    def read(str) do
        str
    end
    def eval(ast,env) do
        ast
    end
    def print(exp) do
        exp
    end
    def repl(str) do
        print(eval(read(str),[]))
    end
    def loop do
        str = IO.gets "user>"
        unless String.length(str) < 2 do
            IO.write(Step0_Repl.repl(str))
            loop
        end
    end
end
