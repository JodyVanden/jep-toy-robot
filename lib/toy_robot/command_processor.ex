defmodule ToyRobot.CommandProcessor do
  @doc """
  Processes commandes from a commands list, in preparation for handling them.

  ## Examples
    iex> alias ToyRobot.CommandProcessor
    ToyRobot.CommandProcessor
    iex> commands = ["PLACE 1,2,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    ["PLACE 1,2,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    iex> commands |> CommandProcessor.process()
    [
      {:place, %{north: 2, east: 1, facing: :north}},
      :move,
      :turn_left,
      :turn_right,
      :report,
    ]
  """
  def process(commands) do
    commands |> Enum.map(&do_process/1)
  end

  defp do_process("PLACE " <> rest) do
    [east, north, facing] = rest |> String.split(",")
    to_int = &String.to_integer/1

    {:place, %{
      east: to_int.(east),
      north: to_int.(north),
      facing: facing |> String.downcase |> String.to_atom
    }}
  end

  defp do_process("MOVE"), do: :move
  defp do_process("LEFT"), do: :turn_left
  defp do_process("RIGHT"), do: :turn_right
  defp do_process("REPORT"), do: :report
  defp do_process(command), do: {:invalid, command}
end