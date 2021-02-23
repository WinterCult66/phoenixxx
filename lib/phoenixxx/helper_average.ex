defmodule Phoenixxx.HelperAverage do
  @moduledoc """
  The HelperAverage context.
  """

  import Ecto.Query, warn: false
  alias Phoenixxx.Repo

  alias Phoenixxx.HelperAverage.Average

  @doc """
  Returns the list of average.

  ## Examples

      iex> list_average()
      [%Average{}, ...]

  """
  def list_average do
    Repo.all(Average)
  end

  @doc """
  Gets a single average.

  Raises `Ecto.NoResultsError` if the Average does not exist.

  ## Examples

      iex> get_average!(123)
      %Average{}

      iex> get_average!(456)
      ** (Ecto.NoResultsError)

  """
  def get_average!(id), do: Repo.get!(Average, id)

  @doc """
  Creates a average.

  ## Examples

      iex> create_average(%{field: value})
      {:ok, %Average{}}

      iex> create_average(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_average(attrs \\ %{}) do
    %Average{}
    |> Average.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a average.

  ## Examples

      iex> update_average(average, %{field: new_value})
      {:ok, %Average{}}

      iex> update_average(average, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_average(%Average{} = average, attrs) do
    average
    |> Average.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a average.

  ## Examples

      iex> delete_average(average)
      {:ok, %Average{}}

      iex> delete_average(average)
      {:error, %Ecto.Changeset{}}

  """
  def delete_average(%Average{} = average) do
    Repo.delete(average)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking average changes.

  ## Examples

      iex> change_average(average)
      %Ecto.Changeset{source: %Average{}}

  """
  def change_average(%Average{} = average) do
    Average.changeset(average, %{})
  end

  def validate_if_exist_new_item(element) do
    query = from(m in Average, where: m.name_of_avg == ^element, select: m)
    Repo.one(query)
  end
end
