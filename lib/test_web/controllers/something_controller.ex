defmodule TestWeb.SomethingController do
  use TestWeb, :controller

  alias Test.SomeContext
  alias Test.SomeContext.Something

  def index(conn, _params) do
    somethings = SomeContext.list_somethings()
    render(conn, "index.html", somethings: somethings)
  end

  def new(conn, _params) do
    changeset = SomeContext.change_something(%Something{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"something" => something_params}) do
    case SomeContext.create_something(something_params) do
      {:ok, something} ->
        conn
        |> put_flash(:info, "Something created successfully.")
        |> redirect(to: Routes.something_path(conn, :show, something))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    something = SomeContext.get_something!(id)
    render(conn, "show.html", something: something)
  end

  def edit(conn, %{"id" => id}) do
    something = SomeContext.get_something!(id)
    changeset = SomeContext.change_something(something)
    render(conn, "edit.html", something: something, changeset: changeset)
  end

  def update(conn, %{"id" => id, "something" => something_params}) do
    something = SomeContext.get_something!(id)

    case SomeContext.update_something(something, something_params) do
      {:ok, something} ->
        conn
        |> put_flash(:info, "Something updated successfully.")
        |> redirect(to: Routes.something_path(conn, :show, something))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", something: something, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    something = SomeContext.get_something!(id)
    {:ok, _something} = SomeContext.delete_something(something)

    conn
    |> put_flash(:info, "Something deleted successfully.")
    |> redirect(to: Routes.something_path(conn, :index))
  end
end
