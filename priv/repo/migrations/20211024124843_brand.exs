defmodule Cars.Repo.Migrations.Brand do
  use Ecto.Migration

  def change do
    create table (:brand) do
      add(:description, :string)
      timestamps()
    end
  end
end
