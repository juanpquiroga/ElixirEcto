defmodule Cars.Brand do
  use Ecto.Schema

  schema "brand" do
    field( :description, :string )
    timestamps()
    has_many(:cars, Cars.Car)
  end
end
