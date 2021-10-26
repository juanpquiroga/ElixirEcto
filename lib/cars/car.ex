defmodule Cars.Car do
  use Ecto.Schema

    schema "car" do
    #field( :brand_id, :integer )
    field( :name, :string )
    field( :model, :integer)
    field( :owner, :string )
    timestamps()
    belongs_to(:brand, Cars.Brand)
    #has_one( :brand_id, Cars.Brand)
  end

  def changeset(car, params \\ %{}) do
    car
    |> Ecto.Changeset.cast(params, [:name, :model, :brand_id])
    |> Ecto.Changeset.validate_required([:name, :model, :brand_id])
  end
end
