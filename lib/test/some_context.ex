defmodule Test.SomeContext do
  @moduledoc """
  The SomeContext context.
  """

  import Ecto.Query, warn: false
  alias Test.Repo

  alias Test.SomeContext.Something

  @doc """
  Returns the list of somethings.

  ## Examples

      iex> list_somethings()
      [%Something{}, ...]

  """
  def list_somethings do
    Repo.all(Something)
  end

  @doc """
  Gets a single something.

  Raises `Ecto.NoResultsError` if the Something does not exist.

  ## Examples

      iex> get_something!(123)
      %Something{}

      iex> get_something!(456)
      ** (Ecto.NoResultsError)

  """
  def get_something!(id), do: Repo.get!(Something, id)

  @doc """
  Creates a something.

  ## Examples

      iex> create_something(%{field: value})
      {:ok, %Something{}}

      iex> create_something(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_something(attrs \\ %{}) do
    %Something{}
    |> Something.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a something.

  ## Examples

      iex> update_something(something, %{field: new_value})
      {:ok, %Something{}}

      iex> update_something(something, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_something(%Something{} = something, attrs) do
    something
    |> Something.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a something.

  ## Examples

      iex> delete_something(something)
      {:ok, %Something{}}

      iex> delete_something(something)
      {:error, %Ecto.Changeset{}}

  """
  def delete_something(%Something{} = something) do
    Repo.delete(something)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking something changes.

  ## Examples

      iex> change_something(something)
      %Ecto.Changeset{data: %Something{}}

  """
  def change_something(%Something{} = something, attrs \\ %{}) do
    Something.changeset(something, attrs)
  end
end
