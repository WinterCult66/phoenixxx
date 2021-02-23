defmodule PhoenixxxWeb.RegardsControllerTest do
  use PhoenixxxWeb.ConnCase

  alias Phoenixxx.Regardsx

  @create_attrs %{regard: "some regard", regardN: 42}
  @update_attrs %{regard: "some updated regard", regardN: 43}
  @invalid_attrs %{regard: nil, regardN: nil}

  def fixture(:regards) do
    {:ok, regards} = Regardsx.create_regards(@create_attrs)
    regards
  end

  describe "index" do
    test "lists all regards", %{conn: conn} do
      conn = get(conn, Routes.regards_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Regards"
    end
  end

  describe "new regards" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.regards_path(conn, :new))
      assert html_response(conn, 200) =~ "New Regards"
    end
  end

  describe "create regards" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.regards_path(conn, :create), regards: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.regards_path(conn, :show, id)

      conn = get(conn, Routes.regards_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Regards"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.regards_path(conn, :create), regards: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Regards"
    end
  end

  describe "edit regards" do
    setup [:create_regards]

    test "renders form for editing chosen regards", %{conn: conn, regards: regards} do
      conn = get(conn, Routes.regards_path(conn, :edit, regards))
      assert html_response(conn, 200) =~ "Edit Regards"
    end
  end

  describe "update regards" do
    setup [:create_regards]

    test "redirects when data is valid", %{conn: conn, regards: regards} do
      conn = put(conn, Routes.regards_path(conn, :update, regards), regards: @update_attrs)
      assert redirected_to(conn) == Routes.regards_path(conn, :show, regards)

      conn = get(conn, Routes.regards_path(conn, :show, regards))
      assert html_response(conn, 200) =~ "some updated regard"
    end

    test "renders errors when data is invalid", %{conn: conn, regards: regards} do
      conn = put(conn, Routes.regards_path(conn, :update, regards), regards: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Regards"
    end
  end

  describe "delete regards" do
    setup [:create_regards]

    test "deletes chosen regards", %{conn: conn, regards: regards} do
      conn = delete(conn, Routes.regards_path(conn, :delete, regards))
      assert redirected_to(conn) == Routes.regards_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.regards_path(conn, :show, regards))
      end
    end
  end

  defp create_regards(_) do
    regards = fixture(:regards)
    {:ok, regards: regards}
  end
end
