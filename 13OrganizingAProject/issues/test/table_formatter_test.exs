defmodule TableFormatterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @data_for_column_tests [
    %{"a" => "alpha", "b" => "bravo"},
    %{"a" => "albatross", "b" => "bravo"}
  ]

  @expected_table """
   | a         | b    
  --------------------
   | alpha     | bravo
   | albatross | bravo
  """

  import Issues.TableFormatter

  test "get_longest_column/2 returns longest row length in column" do
    assert get_longest_column(@data_for_column_tests, "a") === 9
  end

  test "get_column_widiths/2 returns maximum column widths" do
    assert get_column_widths(@data_for_column_tests, ["a", "b"]) === %{"a" => 9, "b" => 5}
  end

  test "print_headers/2 prints padded headers" do
    assert print_headers(
             ["a", "b"],
             %{"a" => 5, "b" => 2}
           ) === " | a     | b "
  end

  test "print_separator/1 prints a separator of appropriate length" do
    assert print_separator(%{"a" => 2, "b" => 3}) === "-----------"
  end

  test "print_row/3 returns a string that is a row padded to given length" do
    assert print_row(
             %{"a" => "alpha", "b" => "boot"},
             %{"a" => 9, "b" => 5},
             ["a", "b"]
           ) === " | alpha     | boot "
  end

  test "print_table_for_columns/2 prints a complete table" do
    result = capture_io(fn -> print_table_for_columns(@data_for_column_tests, ["a", "b"]) end)
    assert result === @expected_table
  end
end
