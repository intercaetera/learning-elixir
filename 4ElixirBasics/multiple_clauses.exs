handle_open = fn
  { :ok, file } -> "Read data: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, c) -> c
end

IO.puts(fizz_buzz.(0, 0, 3))
IO.puts(fizz_buzz.(0, 2, 3))
IO.puts(fizz_buzz.(3, 0, 2))
IO.puts(fizz_buzz.(1, 2, 3))

prefix = fn prefix -> fn suffix -> prefix <> " " <> suffix end end

mrs = prefix.("Mrs")
IO.puts(mrs.("Smith"))
IO.puts(prefix.("elixir").("rocks"))
