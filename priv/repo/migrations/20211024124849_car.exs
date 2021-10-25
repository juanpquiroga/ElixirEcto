defmodule Cars.Repo.Migrations.Car do
  use Ecto.Migration

  def change do
    create table(:car) do
      #add(:id, :uuid, primary_key: true)
      #add(:brand_id, references( :brand, type: :uuid, null: false ) )
      add(:brand_id, references( :brand, null: false ) )
      add(:name, :string)
      add(:model, :integer)
      add(:owner, :string)
      timestamps()
    end
  end
end
