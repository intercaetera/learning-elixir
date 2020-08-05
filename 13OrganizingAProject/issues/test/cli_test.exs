defmodule CliTest do
  use ExUnit.Case

  import Issues.CLI, only: [parse_args: 1, sort_into_descending_order: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["--assist", "anything"]) == :assist
    assert parse_args(["-h", "anything"]) == :assist
    assert parse_args(["--help", "anything"]) == :assist
  end

  test "three values returned if three given" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "count is defaulted if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end

  test "sort descending orders the correct way" do
    result = sort_into_descending_order(fake_created_at_list(["c", "d", "a", "b"]))
    issues = for issue <- result, do: Map.get(issue, "created_at")
    assert issues == ["d", "c", "b", "a"]
  end

  defp fake_created_at_list(values) do
    for value <- values,
        do: %{"created_at" => value, "other_data" => "xxx"}
  end
end
