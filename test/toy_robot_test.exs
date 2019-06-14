defmodule ToyRobotTest do
  alias ToyRobot, as: Robot
  use ExUnit.Case
  doctest ToyRobot

  describe "when the robot is facing west and has moved forward north once" do
    setup do
      {:ok, %{robot: %Robot{north: 1, facing: :west}}}
    end
    test "it turns left and keep north value", %{robot: robot} do
      robot = robot |> Robot.move
      assert robot.north == 1
      assert robot.east == -1
      assert robot.facing == :west
    end
  end

  describe "when the robot is facing south and has moved forward north once" do
    setup do
      {:ok, %{robot: %Robot{east: 1, north: 1, facing: :south}}}
    end
    test "it turns left and keep north value", %{robot: robot} do
      robot = robot |> Robot.move
      assert robot.north == 0
      assert robot.east == 1
      assert robot.facing == :south
    end
  end

  describe "when the robot is facing north and has moved forward north once" do
    setup do
      {:ok, %{robot: %Robot{north: 1, facing: :north}}}
    end
    test "it turns left and keep north value", %{robot: robot} do
      robot = robot |> Robot.turn_left
      assert robot.north == 1
      assert robot.facing == :west
    end

    test "it moves north and keep north value", %{robot: robot} do
      robot = robot |> Robot.move
      assert robot.north == 2
      assert robot.east == 0
      assert robot.facing == :north
    end

    test "it turns right and keep north value", %{robot: robot} do
      robot = robot |> Robot.turn_right
      assert robot.north == 1
      assert robot.facing == :east
    end
  end

  describe "when the robot is facing east and has moved forward north once" do
    setup do
      {:ok, %{robot: %Robot{north: 1, facing: :east}}}
    end
    test "it moves forward east keep north value", %{robot: robot} do
      robot = robot |> Robot.move
      assert robot.north == 1
      assert robot.east == 1
      assert robot.facing == :east
    end
  end

  describe "when the robot is facing north" do
    setup do
      {:ok, %{robot: %Robot{north: 0, facing: :north}}}
    end

    test "it moves one space north", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
    end

    test "turns left to face west", %{robot: robot} do
      robot = robot |> Robot.turn_left
      assert robot.facing == :west
    end

    test "turns right to face east", %{robot: robot} do
      robot = robot |> Robot.turn_right
      assert robot.facing == :east
    end
  end

  describe "when the robot is facing east" do
    setup do
      {:ok, %{robot: %Robot{east: 0, facing: :east}}}
    end

    test "it moves one space east", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.east == 1
    end

    test "turns left to face north", %{robot: robot} do
      robot = robot |> Robot.turn_left
      assert robot.facing == :north
    end

    test "turns right to face south", %{robot: robot} do
      robot = robot |> Robot.turn_right
      assert robot.facing == :south
    end
  end

  describe "when the robot is facing south" do
    setup do
      {:ok, %{robot: %Robot{north: 0, facing: :south}}}
    end

    test "it moves one space south", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == -1
    end

    test "turns left to face east", %{robot: robot} do
      robot = robot |> Robot.turn_left
      assert robot.facing == :east
    end
  end

  describe "when the robot is facing west" do
    setup do
      {:ok, %{robot: %Robot{east: 0, facing: :west}}}
    end

    test "it moves one space north", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.east == -1
    end

    test "turns left to face south", %{robot: robot} do
      robot = robot |> Robot.turn_left
      assert robot.facing == :south
    end
  end
end
