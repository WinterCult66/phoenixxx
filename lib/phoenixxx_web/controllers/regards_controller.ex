defmodule PhoenixxxWeb.RegardsController do
  use PhoenixxxWeb, :controller

  alias Phoenixxx.Regardsx
  alias Phoenixxx.Regardsx.Regards

  def index(conn, _params) do
    regards = Regardsx.list_regards()
    render(conn, "index.html", regards: regards)
  end

  def new(conn, _params) do
    changeset = Regardsx.change_regards(%Regards{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"regards" => regards_params}) do
    case Regardsx.create_regards(regards_params) do
      {:ok, regards} ->
        conn
        |> put_flash(:info, "Regards created successfully.")
        |> redirect(to: Routes.regards_path(conn, :show, regards))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    regards = Regardsx.get_regards!(id)
    render(conn, "show.html", regards: regards)
  end

  def edit(conn, %{"id" => id}) do
    regards = Regardsx.get_regards!(id)
    changeset = Regardsx.change_regards(regards)
    render(conn, "edit.html", regards: regards, changeset: changeset)
  end

  def update(conn, %{"id" => id, "regards" => regards_params}) do
    regards = Regardsx.get_regards!(id)

    case Regardsx.update_regards(regards, regards_params) do
      {:ok, regards} ->
        conn
        |> put_flash(:info, "Regards updated successfully.")
        |> redirect(to: Routes.regards_path(conn, :show, regards))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", regards: regards, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    regards = Regardsx.get_regards!(id)
    {:ok, _regards} = Regardsx.delete_regards(regards)

    conn
    |> put_flash(:info, "Regards deleted successfully.")
    |> redirect(to: Routes.regards_path(conn, :index))
  end
end
