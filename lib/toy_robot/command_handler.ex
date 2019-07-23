defmodule ToyRobot.CommandHandler do
  alias ToyRobot.{Simulation, Table}

  @doc """
  Takes a command (usually fron `ToyRobot.CommandProcessor`) and executes it.

  ## PLACE command

    iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Table}
    [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Table]
    iex> command = {:place, %{north: 1, east: 2, facing: :north}}
    iex> CommandHandler.handle(command)
    {:ok, %Simulation{
      table: %Table{north_boundary: 4, east_boundary: 4},
      robot: %Robot{north: 1, east: 2, facing: :north}
    }}

    ## :move command

      iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Table}
      [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Table]
      iex> simulation = %Simulation{
      ...>  table: %Table{north_boundary: 4, east_boundary: 4},
      ...>  robot: %Robot{north: 1, east: 2, facing: :north}
      ...> }
      iex> CommandHandler.handle(:move, simulation)
      {:ok, %Simulation{
        table: %Table{north_boundary: 4, east_boundary: 4},
        robot: %Robot{north: 2, east: 2, facing: :north}
      }}

    ## :turn_left command
    iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Table}
    [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Table]
    iex> simulation = %Simulation{
    ...>  table: %Table{north_boundary: 4, east_boundary: 4},
    ...>  robot: %Robot{north: 1, east: 2, facing: :north}
    ...> }
    iex> CommandHandler.handle(:turn_left, simulation)
    {:ok, %Simulation{
      table: %Table{north_boundary: 4, east_boundary: 4},
      robot: %Robot{north: 1, east: 2, facing: :west}
    }}

    ## :turn_right command

    iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Table}
    [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Table]
    iex> simulation = %Simulation{
    ...>  table: %Table{north_boundary: 4, east_boundary: 4},
    ...>  robot: %Robot{north: 1, east: 2, facing: :north}
    ...> }
    iex> CommandHandler.handle(:turn_right, simulation)
    {:ok, %Simulation{
      table: %Table{north_boundary: 4, east_boundary: 4},
      robot: %Robot{north: 1, east: 2, facing: :east}
    }}

    ## :report command

    iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Table}
    [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Table]
    iex> simulation = %Simulation{
    ...>  table: %Table{north_boundary: 4, east_boundary: 4},
    ...>  robot: %Robot{north: 1, east: 2, facing: :north}
    ...> }
    iex> CommandHandler.handle(:report, simulation)
    %Robot{north: 1, east: 2, facing: :north}

    ## Invalid commands

    iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Table}
    [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Table]
    iex> simulation = %Simulation{
    ...>  table: %Table{north_boundary: 4, east_boundary: 4},
    ...>  robot: %Robot{north: 1, east: 2, facing: :north}
    ...> }
    iex> CommandHandler.handle({:invalid, "EXTERMINATE"}, simulation)
    {:invalid, "EXTERMINATE"}
  """

  def handle({:place, placement}) do
    %Table{
      north_boundary: 4,
      east_boundary: 4,
    } |> Simulation.place(placement)
  end

  def handle(:move, simulation) do
    simulation |> Simulation.move
  end

  def handle(:turn_left, simulation) do
    simulation |> Simulation.turn_left
  end

  def handle(:turn_right, simulation) do
    simulation |> Simulation.turn_right
  end

  def handle(:report, simulation) do
    simulation |> Simulation.report
  end

  def handle({:invalid, _cmd} = command, _simulation), do: command
end