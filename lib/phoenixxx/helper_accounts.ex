defmodule Phoenixxx.HelperAccounts do
  @moduledoc """
  The HelperAccounts context.
  """

  import Ecto.Query, warn: false
  alias Phoenixxx.Repo

  alias Phoenixxx.HelperAccounts.SuperRegards

  @doc """
  Returns the list of superregards.

  ## Examples

      iex> list_superregards()
      [%SuperRegards{}, ...]

  """
  def list_superregards do
    Repo.all(SuperRegards)
  end

  @doc """
  Gets a single super_regards.

  Raises `Ecto.NoResultsError` if the Super regards does not exist.

  ## Examples

      iex> get_super_regards!(123)
      %SuperRegards{}

      iex> get_super_regards!(456)
      ** (Ecto.NoResultsError)

  """
  def get_super_regards!(id), do: Repo.get!(SuperRegards, id)

  @doc """
  Creates a super_regards.

  ## Examples

      iex> create_super_regards(%{field: value})
      {:ok, %SuperRegards{}}

      iex> create_super_regards(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_super_regards(attrs \\ %{}) do
    %SuperRegards{}
    |> SuperRegards.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a super_regards.

  ## Examples

      iex> update_super_regards(super_regards, %{field: new_value})
      {:ok, %SuperRegards{}}

      iex> update_super_regards(super_regards, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_super_regards(%SuperRegards{} = super_regards, attrs) do
    super_regards
    |> SuperRegards.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a super_regards.

  ## Examples

      iex> delete_super_regards(super_regards)
      {:ok, %SuperRegards{}}

      iex> delete_super_regards(super_regards)
      {:error, %Ecto.Changeset{}}

  """
  def delete_super_regards(%SuperRegards{} = super_regards) do
    Repo.delete(super_regards)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking super_regards changes.

  ## Examples

      iex> change_super_regards(super_regards)
      %Ecto.Changeset{source: %SuperRegards{}}

  """
  def change_super_regards(%SuperRegards{} = super_regards) do
    SuperRegards.changeset(super_regards, %{})
  end
end
