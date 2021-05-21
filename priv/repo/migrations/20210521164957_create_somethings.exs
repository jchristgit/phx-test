defmodule Test.Repo.Migrations.CreateSomethings do
  use Ecto.Migration

  def change do
    create table(:somethings) do
      add :name, :string

      timestamps()
    end

  end
end
