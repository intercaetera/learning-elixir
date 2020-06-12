# ModulesAndFunctions-6
defmodule Chop do
  def guess(actual, min..max) when is_integer(actual) do
    shot = div(max-min, 2) + min
    IO.puts("Guessing #{shot}")

    answer = fn
      (actual, shot) when actual < shot -> guess(actual, min..shot-1)
      (actual, shot) when actual > shot -> guess(actual, shot+1..max)
      (actual, _) -> IO.puts(actual)
    end

    answer.(actual, shot)
  end
end
