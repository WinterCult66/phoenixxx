defmodule PhoenixxxWeb.AverageControllerTest do
  use PhoenixxxWeb.ConnCase

  alias Phoenixxx.HelperAverage

  @create_attrs %{average_of_page: "some average_of_page", name_of_avg: "some name_of_avg"}
  @update_attrs %{
    average_of_page: "some updated average_of_page",
    name_of_avg: "some updated name_of_avg"
  }
  @invalid_attrs %{average_of_page: nil, name_of_avg: nil}

  def fixture(:average) do
    {:ok, average} = HelperAverage.create_average(@create_attrs)
    average
  end

  describe "index" do
    test "lists all average", %{conn: conn} do
      conn = get(conn, Routes.average_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Average"
    end
  end

  describe "new average" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.average_path(conn, :new))
      assert html_response(conn, 200) =~ "New Average"
    end
  end

  describe "create average" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.average_path(conn, :create), average: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.average_path(conn, :show, id)

      conn = get(conn, Routes.average_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Average"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.average_path(conn, :create), average: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Average"
    end
  end

  describe "edit average" do
    setup [:create_average]

    test "renders form for editing chosen average", %{conn: conn, average: average} do
      conn = get(conn, Routes.average_path(conn, :edit, average))
      assert html_response(conn, 200) =~ "Edit Average"
    end
  end

  describe "update average" do
    setup [:create_average]

    test "redirects when data is valid", %{conn: conn, average: average} do
      conn = put(conn, Routes.average_path(conn, :update, average), average: @update_attrs)
      assert redirected_to(conn) == Routes.average_path(conn, :show, average)

      conn = get(conn, Routes.average_path(conn, :show, average))
      assert html_response(conn, 200) =~ "some updated average_of_page"
    end

    test "renders errors when data is invalid", %{conn: conn, average: average} do
      conn = put(conn, Routes.average_path(conn, :update, average), average: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Average"
    end
  end

  describe "delete average" do
    setup [:create_average]

    test "deletes chosen average", %{conn: conn, average: average} do
      conn = delete(conn, Routes.average_path(conn, :delete, average))
      assert redirected_to(conn) == Routes.average_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.average_path(conn, :show, average))
      end
    end
  end

  defp create_average(_) do
    average = fixture(:average)
    {:ok, average: average}
  end
end
