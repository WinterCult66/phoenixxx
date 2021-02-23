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

  alias Phoenixxx.HelperAccounts.Accounts

  @doc """
  Returns the list of accounts.

  ## Examples

      iex> list_accounts()
      [%Accounts{}, ...]

  """
  def list_accounts do
    Repo.all(Accounts)
  end

  @doc """
  Gets a single accounts.

  Raises `Ecto.NoResultsError` if the Accounts does not exist.

  ## Examples

      iex> get_accounts!(123)
      %Accounts{}

      iex> get_accounts!(456)
      ** (Ecto.NoResultsError)

  """
  def get_accounts!(id), do: Repo.get!(Accounts, id)

  @doc """
  Creates a accounts.

  ## Examples

      iex> create_accounts(%{field: value})
      {:ok, %Accounts{}}

      iex> create_accounts(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_accounts(attrs \\ %{}) do
    %Accounts{}
    |> Accounts.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a accounts.

  ## Examples

      iex> update_accounts(accounts, %{field: new_value})
      {:ok, %Accounts{}}

      iex> update_accounts(accounts, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_accounts(%Accounts{} = accounts, attrs) do
    accounts
    |> Accounts.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a accounts.

  ## Examples

      iex> delete_accounts(accounts)
      {:ok, %Accounts{}}

      iex> delete_accounts(accounts)
      {:error, %Ecto.Changeset{}}

  """
  def delete_accounts(%Accounts{} = accounts) do
    Repo.delete(accounts)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking accounts changes.

  ## Examples

      iex> change_accounts(accounts)
      %Ecto.Changeset{source: %Accounts{}}

  """
  def change_accounts(%Accounts{} = accounts) do
    Accounts.changeset(accounts, %{})
  end
end
