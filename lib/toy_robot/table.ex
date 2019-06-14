defmodule ToyRobot.Table do
  defstruct [:north_boundary, :east_boundary]
  alias ToyRobot.Table

  @moduledoc """
  Documentation for ToyRobot.
  """

  @doc """
  Determines if a position would be within the table's boundaries.

  ## Examples

    iex> alias ToyRobot.Table
    ToyRobot.Table
    iex> table = %Table{north_boundary: 4, east_boundary:4}
    %Table{north_boundary: 4, east_boundary: 4}
    iex> table |> Table.valid_position?(%{north_boundary: 4, east_boundary: 5})
    false
    iex> table |> Table.valid_position?(%{north_boundary: 4, east_boundary: 4})
    true
    iex> table |> Table.valid_position?(%{north_boundary: 6, east_boundary: 0})
    false
"""

  def valid_position?(
    %Table{north_boundary: north_boundary, east_boundary: east_boundary},
    %{north: north, east: east}
  ) do
    north >= 0 && north <= north_boundary &&
    east >= 0 && east <= east_boundary
  end
end