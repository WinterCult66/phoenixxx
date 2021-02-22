defmodule Phoenixxx.Regardsx do
  import Ecto.Query, only: [from: 2]
  @moduledoc """
  The Regardsx context.
  """

  import Ecto.Query, warn: false
  alias Phoenixxx.Repo

  alias Phoenixxx.Regardsx.Regards

  @doc """
  Returns the list of regards.

  ## Examples

      iex> list_regards()
      [%Regards{}, ...]

  """
  def list_regards do
    Repo.all(Regards)
  end

  @doc """
  Gets a single regards.

  Raises `Ecto.NoResultsError` if the Regards does not exist.

  ## Examples

      iex> get_regards!(123)
      %Regards{}

      iex> get_regards!(456)
      ** (Ecto.NoResultsError)

  """
  def get_regards!(id), do: Repo.get!(Regards, id)

  @doc """
  Creates a regards.

  ## Examples

      iex> create_regards(%{field: value})
      {:ok, %Regards{}}

      iex> create_regards(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_regards(attrs \\ %{}) do
    %Regards{}
    |> Regards.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a regards.

  ## Examples

      iex> update_regards(regards, %{field: new_value})
      {:ok, %Regards{}}

      iex> update_regards(regards, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_regards(%Regards{} = regards, attrs) do
    regards
    |> Regards.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a regards.

  ## Examples

      iex> delete_regards(regards)
      {:ok, %Regards{}}

      iex> delete_regards(regards)
      {:error, %Ecto.Changeset{}}

  """
  def delete_regards(%Regards{} = regards) do
    Repo.delete(regards)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking regards changes.

  ## Examples

      iex> change_regards(regards)
      %Ecto.Changeset{source: %Regards{}}

  """
  def change_regards(%Regards{} = regards) do
    Regards.changeset(regards, %{})
  end

  def last_regard() do
    query = from regard in Regards,
          select: regard,
          order_by: [desc: :inserted_at] ,
          limit: 1
     Repo.one(query)
  end
end
