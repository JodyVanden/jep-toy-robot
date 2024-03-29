defmodule ToyRobot.Simulation do
  defstruct [:table, :robot]
  alias ToyRobot.{Robot, Table, Simulation}

  @doc """
  Simulates placing the robot on the table.

  ## Examples

  when the robot is placed in a valid position

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{north_boundary: 4, east_boundary: 4}
    %Table{north_boundary: 4, east_boundary: 4}
    iex> Simulation.place(table, %{north: 0, east: 0, facing: :north})
    {
      :ok,
      %Simulation{
        table: table,
        robot: %Robot{north: 0, east: 0, facing: :north}
      }
    }

    when the robot is placed in an invalid position

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{north_boundary: 4, east_boundary: 4}
    %Table{north_boundary: 4, east_boundary: 4}
    iex> Simulation.place(table, %{north: 6, east: 0, facing: :north})
    {:error, :invalid_placement}
  """

  @doc """
    Moves the robot forward one space in the direction that it is facing,unless that position is past the bou\
    ndaries of the table.

    ## Examples

    ### A valid movement

      iex> alias ToyRobot.{Robot, Table, Simulation}
      [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
      iex> table = %Table{north_boundary: 4, east_boundary: 4}
      %Table{north_boundary: 4, east_boundary: 4}
      iex> simulation = %Simulation{
      ...>  table: table,
      ...>  robot: %Robot{north: 0, east: 0, facing: :north}
      ...> }
      iex> simulation |> Simulation.move
      {:ok, %Simulation{
        table: table,
        robot: %Robot{north: 1, east: 0, facing: :north}
      }}

    ### An invalid movement
      iex> alias ToyRobot.{Robot, Table, Simulation}
      [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
      iex> table = %Table{north_boundary: 4, east_boundary: 4}
      %Table{north_boundary: 4, east_boundary: 4}
      iex> simulation = %Simulation{
      ...>  table: table,
      ...>  robot: %Robot{north: 4, east: 0, facing: :north}
      ...> }
      iex> simulation |> Simulation.move
      {:error, :at_table_boundary}

  """

  @doc """
  Turns the robot left.

  ## Examples

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{north_boundary: 4, east_boundary: 4}
    %Table{north_boundary: 4, east_boundary: 4}
    iex> simulation = %Simulation{
    ...>  table: table,
    ...>  robot: %Robot{north: 0, east: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.turn_left
    {:ok, %Simulation{
      table: table,
      robot: %Robot{north: 0, east: 0, facing: :west}
      }}
  """

  def turn_left(%{robot: robot} = simulation) do
    {:ok, %{simulation | robot: robot |> Robot.turn_left}}
  end

  @doc """
  Turns the robot right.

  ## Examples

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{north_boundary: 4, east_boundary: 4}
    %Table{north_boundary: 4, east_boundary: 4}
    iex> simulation = %Simulation{
    ...>  table: table,
    ...>  robot: %Robot{north: 0, east: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.turn_right
    {:ok, %Simulation{
      table: table,
      robot: %Robot{north: 0, east: 0, facing: :east}
    }}
  """


  def turn_right(%{robot: robot} = simulation) do
    {:ok, %{simulation | robot: robot |> Robot.turn_right}}
  end

  @doc """
  Returns the robot's current position

  ## Examples

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{north_boundary: 5, east_boundary: 5}
    %Table{north_boundary: 5, east_boundary: 5}
    iex> simulation = %Simulation{
    ...>  table: table,
    ...>  robot: %Robot{north: 0, east: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.report
    %Robot{north: 0, east: 0, facing: :north}
  """

  def report(%Simulation{robot: robot}), do: robot

  def move(%{robot: robot, table: table} = simulation) do
    moved_robot = robot |> Robot.move
    valid_position = table |> Table.valid_position?(moved_robot)

    if valid_position do
      {:ok, %{simulation | robot: moved_robot}}
    else
      {:error, :at_table_boundary}
    end
  end

  def place(table, placement) do
    if table |> Table.valid_position?(placement) do
      {
        :ok,
        %Simulation{
          table: table,
          robot: struct(Robot, placement)
        }
      }
    else
      {:error, :invalid_placement}
    end

    # case Simulation.place(table, placement) do
    #   {:ok, simulation} ->
    #     IO.puts "All good"
    #     #Do something with simulation here
    #   {:error, :invalid_placement} ->
    #     IO.puts "That placement was invalid."
    # end
  end
end