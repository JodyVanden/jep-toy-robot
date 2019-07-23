defmodule ToyRobot.CommandProcessorTest do
  use ExUnit.Case, async: true
  doctest ToyRobot.CommandProcessor

  alias ToyRobot.CommandProcessor

  test "handles all commands" do
    commands = ["PLACE 1,2,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    commands |> CommandProcessor.process()
  end

  test "marks invalid commands as invalid" do
    commands = ["SPIN", "TWIRL", "EXTERMINATE"]
    output = commands |> CommandProcessor.process()
    assert output == [
      {:invalid, "SPIN"},
      {:invalid, "TWIRL"},
      {:invalid, "EXTERMINATE"}
    ]
  end
end