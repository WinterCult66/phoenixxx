defmodule PhoenixxxWeb.SuperRegardsControllerTest do
  use PhoenixxxWeb.ConnCase

  alias Phoenixxx.HelperAccounts

  @create_attrs %{regard: "some regard"}
  @update_attrs %{regard: "some updated regard"}
  @invalid_attrs %{regard: nil}

  def fixture(:super_regards) do
    {:ok, super_regards} = HelperAccounts.create_super_regards(@create_attrs)
    super_regards
  end

  describe "index" do
    test "lists all superregards", %{conn: conn} do
      conn = get(conn, Routes.super_regards_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Superregards"
    end
  end

  describe "new super_regards" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.super_regards_path(conn, :new))
      assert html_response(conn, 200) =~ "New Super regards"
    end
  end

  describe "create super_regards" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.super_regards_path(conn, :create), super_regards: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.super_regards_path(conn, :show, id)

      conn = get(conn, Routes.super_regards_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Super regards"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.super_regards_path(conn, :create), super_regards: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Super regards"
    end
  end

  describe "edit super_regards" do
    setup [:create_super_regards]

    test "renders form for editing chosen super_regards", %{conn: conn, super_regards: super_regards} do
      conn = get(conn, Routes.super_regards_path(conn, :edit, super_regards))
      assert html_response(conn, 200) =~ "Edit Super regards"
    end
  end

  describe "update super_regards" do
    setup [:create_super_regards]

    test "redirects when data is valid", %{conn: conn, super_regards: super_regards} do
      conn = put(conn, Routes.super_regards_path(conn, :update, super_regards), super_regards: @update_attrs)
      assert redirected_to(conn) == Routes.super_regards_path(conn, :show, super_regards)

      conn = get(conn, Routes.super_regards_path(conn, :show, super_regards))
      assert html_response(conn, 200) =~ "some updated regard"
    end

    test "renders errors when data is invalid", %{conn: conn, super_regards: super_regards} do
      conn = put(conn, Routes.super_regards_path(conn, :update, super_regards), super_regards: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Super regards"
    end
  end

  describe "delete super_regards" do
    setup [:create_super_regards]

    test "deletes chosen super_regards", %{conn: conn, super_regards: super_regards} do
      conn = delete(conn, Routes.super_regards_path(conn, :delete, super_regards))
      assert redirected_to(conn) == Routes.super_regards_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.super_regards_path(conn, :show, super_regards))
      end
    end
  end

  defp create_super_regards(_) do
    super_regards = fixture(:super_regards)
    {:ok, super_regards: super_regards}
  end
end
