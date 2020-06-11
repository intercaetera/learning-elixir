defmodule MyList do
  def map([], _func), do: []
  def map([head | tail], func), do: [ func.(head) | map(tail, func) ]

  def sum(list, tally \\ 0)
  def sum([], tally), do: tally
  def sum([head | tail], tally), do: sum(tail, head + tally)

  def reduce([], acc, _), do: acc
  def reduce([head | tail], acc, func), do: reduce(tail, func.(head, acc), func)

  # ListsAndRecursion-1
  def mapsum(list, func), do: list |> map(func) |> sum

  # ListsAndRecursion-2
  def max(list), do: reduce(list, 0, fn
      (val, acc) when val > acc -> val
      (val, acc) when val < acc -> acc
    end)

  # ListsAndRecursion-3
  def caesar(list, n) do
    cipher = fn
      (char) when char + n > ?z -> ?a + (char + n - 1 - ?z)
      (char) -> char + n
    end

    map(list, cipher)
  end
end
