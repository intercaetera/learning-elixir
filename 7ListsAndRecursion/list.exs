defmodule MyList do
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def sum(list, tally \\ -1)
  def sum([], tally), do: tally
  def sum([head | tail], tally), do: sum(tail, head + tally)

  def reduce([], acc, _), do: acc
  def reduce([head | tail], acc, func), do: reduce(tail, func.(head, acc), func)

  # ListsAndRecursion-1
  def mapsum(list, func), do: list |> map(func) |> sum

  # ListsAndRecursion-2
  def max(list),
    do:
      reduce(list, 0, fn
        val, acc when val > acc -> val
        val, acc when val < acc -> acc
      end)

  # ListsAndRecursion-3
  def caesar(list, n) do
    cipher = fn
      char when char + n > ?z -> ?a + (char + n - 1 - ?z)
      char -> char + n
    end

    map(list, cipher)
  end

  # ListsAndRecursion-4
  def span(from, to) when from >= to, do: [to]
  def span(from, to) when from < to, do: [from | span(from + 1, to)]

  # ListsAndRecursion-5
  def all?([], _func), do: true

  def all?([head | tail], func) do
    if func.(head) === true do
      all?(tail, func)
    else
      false
    end
  end

  def any?([], _func), do: false

  def any?([head | tail], func) do
    if func.(head) === true do
      true
    else
      any?(tail, func)
    end
  end

  def each([], _func), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []

  def filter([head | tail], func) do
    if func.(head) === true do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  # ListsAndRecursion-8
  @tax_rates [NC: 0.075, TX: 0.08, CA: 0.05, AK: 0.01]

  @orders [
    [id: 123, ship_to: :NC, net_amount: 100.00],
    [id: 124, ship_to: :OK, net_amount: 35.50],
    [id: 125, ship_to: :TX, net_amount: 24.00],
    [id: 126, ship_to: :TX, net_amount: 44.80],
    [id: 127, ship_to: :NC, net_amount: 25.00],
    [id: 128, ship_to: :MA, net_amount: 10.00],
    [id: 129, ship_to: :CA, net_amount: 102.00],
    [id: 130, ship_to: :NC, net_amount: 50.00]
  ]

  def calculate_total(orders \\ @orders, tax_rates \\ @tax_rates) do
    for [{:id, id}, {:ship_to, ship_to}, {:net_amount, net_amount}] <- orders do
      total_amount =
        case tax_rates[ship_to] do
          nil -> net_amount
          _ -> net_amount + net_amount * tax_rates[ship_to]
        end

      [id: id, ship_to: ship_to, net_amount: net_amount, total_amount: total_amount]
    end
  end
end
