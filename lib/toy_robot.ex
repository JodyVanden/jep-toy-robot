defmodule ToyRobot do
  defstruct north: 0, east: 0, facing: :north
  alias ToyRobot, as: Robot

  @moduledoc """
  Documentation for ToyRobot.
  """

  @doc """
  Turn the robot on the right.

  @Examples
    iex> alias ToyRobot, as: Robot
    Robot
    iex> robot = %Robot {facing: :north}
    %Robot{facing: :north}
    iex> robot |> Robot.turn_right
    %Robot{facing: :east}
  """

  def turn_right(%Robot{facing: facing} = robot) do
    new_facing = case facing do
      :north -> :east
      :south -> :west
      :west -> :north
      :east -> :south
    end
    %Robot{robot | facing: new_facing}
  end

  @doc """
  Turns the robot left.

  ## Examples
    iex> alias ToyRobot, as: Robot
    Robot
    iex> robot = %Robot{facing: :north}
    %Robot{facing: :north}
    iex> robot |> Robot.turn_left
    %Robot{facing: :west}
  """

  def turn_left(%Robot{facing: facing} = robot) do
    new_facing = case facing do
      :north -> :west
      :south -> :east
      :west -> :south
      :east -> :north
    end
    %Robot{robot | facing: new_facing}
  end

  @doc """
  Moves the robot forward on space in the direciton it is facing

  ## Examples
      iex> alias ToyRobot, as: Robot
      ToyRobot
      iex> robot = %Robot{north: 0, facing: :north}
      %Robot{north: 0, facing: :north}
      iex> robot |> Robot.move
      %Robot{north: 1}
  """

  def move(%Robot{facing: facing} = robot) do
    case facing do
      :north -> robot |> move_north
      :south -> robot |> move_south
      :west -> robot |> move_west
      :east -> robot |> move_east
    end
  end

  defp move_east(%Robot{} = robot) do
    %Robot{robot | east: robot.east + 1}
  end

  defp move_west(%Robot{} = robot) do
    %Robot{robot | east: robot.east - 1}
  end

  defp move_north(%Robot{} = robot) do
    %Robot{robot | north: robot.north + 1}
  end

  defp move_south(%Robot{} = robot) do
    %Robot{robot | north: robot.north - 1}
  end
end
