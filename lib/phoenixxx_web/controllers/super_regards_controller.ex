defmodule PhoenixxxWeb.SuperRegardsController do
  use PhoenixxxWeb, :controller

  alias Phoenixxx.HelperAccounts
  alias Phoenixxx.HelperAccounts.SuperRegards

  def index(conn, _params) do
    superregards = HelperAccounts.list_superregards()
    render(conn, "index.html", superregards: superregards)
  end

  def new(conn, _params) do
    changeset = HelperAccounts.change_super_regards(%SuperRegards{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"super_regards" => super_regards_params}) do
    case HelperAccounts.create_super_regards(super_regards_params) do
      {:ok, super_regards} ->
        conn
        |> put_flash(:info, "Super regards created successfully.")
        |> redirect(to: Routes.super_regards_path(conn, :show, super_regards))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    super_regards = HelperAccounts.get_super_regards!(id)
    render(conn, "show.html", super_regards: super_regards)
  end

  def edit(conn, %{"id" => id}) do
    super_regards = HelperAccounts.get_super_regards!(id)
    changeset = HelperAccounts.change_super_regards(super_regards)
    render(conn, "edit.html", super_regards: super_regards, changeset: changeset)
  end

  def update(conn, %{"id" => id, "super_regards" => super_regards_params}) do
    super_regards = HelperAccounts.get_super_regards!(id)

    case HelperAccounts.update_super_regards(super_regards, super_regards_params) do
      {:ok, super_regards} ->
        conn
        |> put_flash(:info, "Super regards updated successfully.")
        |> redirect(to: Routes.super_regards_path(conn, :show, super_regards))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", super_regards: super_regards, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    super_regards = HelperAccounts.get_super_regards!(id)
    {:ok, _super_regards} = HelperAccounts.delete_super_regards(super_regards)

    conn
    |> put_flash(:info, "Super regards deleted successfully.")
    |> redirect(to: Routes.super_regards_path(conn, :index))
  end
end
