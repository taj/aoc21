defmodule DayTwo do
  # Your puzzle answer was 2117664.
  def part_1 do
    %{x: x, depth: depth} =
      read_input()
      |> final_position(%{depth: 0, x: 0})

    x * depth
  end

  defp final_position([], position), do: position

  defp final_position([command | rest], position) do
    new_position = position(command, position)
    final_position(rest, new_position)
  end

  defp position("forward " <> n, %{depth: depth, x: x}) do
    %{depth: depth, x: x + String.to_integer(n)}
  end

  defp position("down " <> n, %{depth: depth, x: x}) do
    %{depth: depth + String.to_integer(n), x: x}
  end

  defp position("up " <> n, %{depth: depth, x: x}) do
    %{depth: depth - String.to_integer(n), x: x}
  end

  # Your puzzle answer was 2073416724.
  def part_2 do
    %{x: x, depth: depth} =
      read_input()
      |> final_position_with_aim(%{depth: 0, x: 0, aim: 0})

    x * depth
  end

  defp final_position_with_aim([], position), do: position

  defp final_position_with_aim([command | rest], position) do
    new_position = position_with_aim(command, position)
    final_position_with_aim(rest, new_position)
  end

  defp position_with_aim("forward " <> n, %{depth: depth, x: x, aim: aim}) do
    n = String.to_integer(n)
    %{depth: depth + aim * n, x: x + n, aim: aim}
  end

  defp position_with_aim("down " <> n, %{depth: depth, x: x, aim: aim}) do
    %{depth: depth, x: x, aim: aim + String.to_integer(n)}
  end

  defp position_with_aim("up " <> n, %{depth: depth, x: x, aim: aim}) do
    %{depth: depth, x: x, aim: aim - String.to_integer(n)}
  end

  defp read_input do
    "lib/inputs/day_two.txt"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
  end
end
