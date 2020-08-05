defmodule Issues.TableFormatter do
  def print_table_for_columns(data, columns) do
    with column_widths = get_column_widths(data, columns) do
      IO.puts(print_headers(columns, column_widths))
      IO.puts(print_separator(column_widths))

      data
      |> Enum.map(fn row -> print_row(row, column_widths, columns) end)
      |> Enum.each(&IO.puts/1)
    end
  end

  def get_column_widths(data, columns) do
    Enum.reduce(columns, %{}, fn column, acc ->
      Map.put(acc, column, get_longest_column(data, column))
    end)
  end

  def get_longest_column(data, column) do
    data
    |> Enum.map(fn e -> e[column] end)
    |> Enum.map(&String.length/1)
    |> Enum.max()
  end

  def print_headers(columns, column_widths) do
    columns
    |> Enum.map(&String.pad_trailing(&1, column_widths[&1]))
    |> Enum.reduce("", fn column, acc -> acc <> " | " <> column end)
  end

  def print_separator(column_widths) do
    Map.values(column_widths)
    |> Enum.reduce("", fn length, acc ->
      acc <> "---" <> String.duplicate("-", length)
    end)
  end

  def print_row(row, column_widths, columns) do
    Enum.reduce(columns, "", fn column, acc ->
      padded_string = String.pad_trailing(row[column], column_widths[column])
      acc <> " | " <> padded_string
    end)
  end
end
