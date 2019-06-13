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

  def turn_right(%Robot{facing: facing}) do
    case facing do
      :north -> %Robot{facing: :east}
      :south -> %Robot{facing: :west}
      :east -> %Robot{facing: :south}
      :west -> %Robot{facing: :north}
    end
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

  def turn_left(%Robot{facing: facing}) do
    case facing do
    :north -> %Robot{facing: :west}
    :east ->  %Robot{facing: :north}
    :west ->  %Robot{facing: :south}
    :south ->  %Robot{facing: :east}
    end
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

  defp move_east(robot) do
    %Robot{east: robot.east + 1}
  end

  defp move_west(robot) do
    %Robot{east: robot.east - 1}
  end

  defp move_north(robot) do
    %Robot{north: robot.north + 1}
  end

  defp move_south(robot) do
    %Robot{north: robot.north - 1}
  end
end
