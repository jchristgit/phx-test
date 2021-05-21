defmodule Test.SomeContextTest do
  use Test.DataCase

  alias Test.SomeContext

  describe "somethings" do
    alias Test.SomeContext.Something

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def something_fixture(attrs \\ %{}) do
      {:ok, something} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SomeContext.create_something()

      something
    end

    test "list_somethings/0 returns all somethings" do
      something = something_fixture()
      assert SomeContext.list_somethings() == [something]
    end

    test "get_something!/1 returns the something with given id" do
      something = something_fixture()
      assert SomeContext.get_something!(something.id) == something
    end

    test "create_something/1 with valid data creates a something" do
      assert {:ok, %Something{} = something} = SomeContext.create_something(@valid_attrs)
      assert something.name == "some name"
    end

    test "create_something/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SomeContext.create_something(@invalid_attrs)
    end

    test "update_something/2 with valid data updates the something" do
      something = something_fixture()
      assert {:ok, %Something{} = something} = SomeContext.update_something(something, @update_attrs)
      assert something.name == "some updated name"
    end

    test "update_something/2 with invalid data returns error changeset" do
      something = something_fixture()
      assert {:error, %Ecto.Changeset{}} = SomeContext.update_something(something, @invalid_attrs)
      assert something == SomeContext.get_something!(something.id)
    end

    test "delete_something/1 deletes the something" do
      something = something_fixture()
      assert {:ok, %Something{}} = SomeContext.delete_something(something)
      assert_raise Ecto.NoResultsError, fn -> SomeContext.get_something!(something.id) end
    end

    test "change_something/1 returns a something changeset" do
      something = something_fixture()
      assert %Ecto.Changeset{} = SomeContext.change_something(something)
    end
  end
end
