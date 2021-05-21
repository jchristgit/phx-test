defmodule TestWeb.SomethingControllerTest do
  use TestWeb.ConnCase

  alias Test.SomeContext

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:something) do
    {:ok, something} = SomeContext.create_something(@create_attrs)
    something
  end

  describe "index" do
    test "lists all somethings", %{conn: conn} do
      conn = get(conn, Routes.something_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Somethings"
    end
  end

  describe "new something" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.something_path(conn, :new))
      assert html_response(conn, 200) =~ "New Something"
    end
  end

  describe "create something" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.something_path(conn, :create), something: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.something_path(conn, :show, id)

      conn = get(conn, Routes.something_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Something"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.something_path(conn, :create), something: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Something"
    end
  end

  describe "edit something" do
    setup [:create_something]

    test "renders form for editing chosen something", %{conn: conn, something: something} do
      conn = get(conn, Routes.something_path(conn, :edit, something))
      assert html_response(conn, 200) =~ "Edit Something"
    end
  end

  describe "update something" do
    setup [:create_something]

    test "redirects when data is valid", %{conn: conn, something: something} do
      conn = put(conn, Routes.something_path(conn, :update, something), something: @update_attrs)
      assert redirected_to(conn) == Routes.something_path(conn, :show, something)

      conn = get(conn, Routes.something_path(conn, :show, something))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, something: something} do
      conn = put(conn, Routes.something_path(conn, :update, something), something: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Something"
    end
  end

  describe "delete something" do
    setup [:create_something]

    test "deletes chosen something", %{conn: conn, something: something} do
      conn = delete(conn, Routes.something_path(conn, :delete, something))
      assert redirected_to(conn) == Routes.something_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.something_path(conn, :show, something))
      end
    end
  end

  defp create_something(_) do
    something = fixture(:something)
    %{something: something}
  end
end
