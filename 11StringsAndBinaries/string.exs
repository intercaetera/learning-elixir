defmodule MyString do
  # StringsAndBinaries-5
  def longest(strings) do
    longer = fn val, acc ->
      if String.length(val) > acc do
        String.length(val)
      else
        acc
      end
    end

    Enum.reduce(strings, 0, longer)
  end

  def print_centered(string, column_width) do
    len = String.length(string)
    pad_size = column_width - len
    left_pad = floor(pad_size / 2)
    right_pad = ceil(pad_size / 2)

    IO.puts(
      string
      |> String.pad_leading(len + left_pad)
      |> String.pad_trailing(len + right_pad)
    )
  end

  def center(strings) do
    column_width = longest(strings)
    Enum.each(strings, &print_centered(&1, column_width))
  end
end
