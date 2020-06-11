defmodule Times do
  # ModulesAndFunctions-1
  def double(n) do
    n * 2
  end

  # ModulesAndFunctions-2
  def triple(n) do
    n * 3
  end

  # ModulesAndFunctions-3
  def quadruple(n) do
    double(double(n))
  end
end

defmodule Maths do
  # ModulesAndFunctions-4
  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)

  # ModulesAndFunctions-5
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end
