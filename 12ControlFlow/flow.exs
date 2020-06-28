defmodule Flow do
  # ControlFlow-1
  def fizzbuzz(n) when n > 0 do
    Enum.map(1..n, fn n -> _fizzbuzz({n, rem(n, 3), rem(n, 5)}) end)
  end

  defp _fizzbuzz(args) do
    case args do
      {_, 0, 0} -> "FizzBuzz"
      {_, 0, _} -> "Fizz"
      {_, _, 0} -> "Buzz"
      {n, _, _} -> n
    end
  end

  # ControlFlow-3
  def ok!({:ok, data}), do: data
  def ok!({:error, reason}), do: raise("Failed with #{reason}")
end
