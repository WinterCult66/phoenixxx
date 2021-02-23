defmodule PhoenixxxWeb.AverageController do
  use PhoenixxxWeb, :controller

  alias Phoenixxx.HelperAverage
  alias Phoenixxx.HelperAverage.Average

  def index(conn, _params) do
    average = HelperAverage.list_average()
    render(conn, "index.html", average: average)
  end

  def new(conn, _params) do
    changeset = HelperAverage.change_average(%Average{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"average" => average_params}) do
    case HelperAverage.create_average(average_params) do
      {:ok, average} ->
        conn
        |> put_flash(:info, "Average created successfully.")
        |> redirect(to: Routes.average_path(conn, :show, average))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    average = HelperAverage.get_average!(id)
    render(conn, "show.html", average: average)
  end

  def edit(conn, %{"id" => id}) do
    average = HelperAverage.get_average!(id)
    changeset = HelperAverage.change_average(average)
    render(conn, "edit.html", average: average, changeset: changeset)
  end

  def update(conn, %{"id" => id, "average" => average_params}) do
    average = HelperAverage.get_average!(id)

    case HelperAverage.update_average(average, average_params) do
      {:ok, average} ->
        conn
        |> put_flash(:info, "Average updated successfully.")
        |> redirect(to: Routes.average_path(conn, :show, average))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", average: average, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    average = HelperAverage.get_average!(id)
    {:ok, _average} = HelperAverage.delete_average(average)

    conn
    |> put_flash(:info, "Average deleted successfully.")
    |> redirect(to: Routes.average_path(conn, :index))
  end
end
