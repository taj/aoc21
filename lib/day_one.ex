defmodule DayOne do
  # Your puzzle answer was 1709.
  def part_1 do
    read_input() |> count_larger_than_previous_measurement()
  end

  #  Your puzzle answer was 1761.
  def part_2 do
    read_input()
    |> three_measurement_sliding_window_sum([])
    |> count_larger_than_previous_measurement()
  end

  defp count_larger_than_previous_measurement(measurements) do
    Enum.reduce(measurements, {0, -1}, fn n, {previous_n, count} ->
      if n > previous_n do
        {n, count + 1}
      else
        {n, count}
      end
    end)
    |> elem(1)
  end

  defp three_measurement_sliding_window_sum([_, _], sum_list), do: sum_list

  defp three_measurement_sliding_window_sum([x, y, z | rest], sum_list) do
    three_measurement_sliding_window_sum([y, z | rest], sum_list ++ [x + y + z])
  end

  defp read_input do
    "lib/inputs/day_one.txt"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end
end
