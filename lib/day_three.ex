defmodule DayThree do
  # Your puzzle answer was 3882564.
  def part_1 do
    {gamma, epsilon} =
      read_input()
      |> reflect()
      |> gamma_epsilon_rates()

    gamma * epsilon
  end

  defp gamma_epsilon_rates(report) do
    {gamma, epsilon} =
      report
      |> Enum.reduce({[], []}, fn line, {gamma, epsilon} ->
        %{"0" => zeros, "1" => ones} = Enum.frequencies(line)

        if zeros < ones do
          {gamma ++ [1], epsilon ++ [0]}
        else
          {gamma ++ [0], epsilon ++ [1]}
        end
      end)

    {binary_to_decimal(gamma), binary_to_decimal(epsilon)}
  end

  defp binary_to_decimal(binary) do
    binary |> Enum.join("") |> Integer.parse(2) |> elem(0)
  end

  defp reflect(report) do
    x_length = report |> Enum.at(0) |> length()
    y_length = report |> length()

    reflexted_matrix = []

    for x <- 0..(x_length - 1) do
      for y <- 0..(y_length - 1) do
        (reflexted_matrix ++ report) |> Enum.at(y) |> Enum.at(x)
      end
    end
  end

  defp read_input do
    "lib/inputs/day_three.txt"
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, "", trim: true))
  end
end
