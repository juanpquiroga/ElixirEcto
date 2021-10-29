defmodule TestStart do
  require Ecto.Query

  def test_brand do
   brand = %Cars.Brand{description: "Renault"}
   Cars.Repo.insert(brand)
   brand1 = %Cars.Brand{description: "Chevrolet"}
   Cars.Repo.insert(brand1)
  end

  def test_insert_car do
    car = %Cars.Car{brand_id: 2, name: "Optra", model: 2019, owner: "Pepe Romero"}
    Cars.Repo.insert(car)
    car2 = %Cars.Car{brand_id: 2, name: "Aveo", model: 2010, owner: "Daniel Perez"}
    Cars.Repo.insert(car2)
  end

  @doc"""
  Genera un nuevo vehiculo asociado a un brand a través de construir la asociación
  """
  def test_insert_car_assoc do
    # Buscar el brand asociado
    brand = Cars.Repo.get!(Cars.Brand, 2)
    # Genera un car a partir de la asociacion uno a muchos de brand
    # con base en el struct Car
    car = %Cars.Car{name: "Cruise", model: 2021, owner: "Pepe Romero"}
    car_to_insert = Ecto.build_assoc( brand, :cars, car)
    # Aca tiene un brand asociado
    IO.inspect(car_to_insert)
    # Aca se puede insertar el nuevo car con el brand asociado
    car_inserted = Cars.Repo.insert!(car_to_insert)
    IO.inspect(car_inserted)
  end

  def test_changeset_error do
    car3 = %Cars.Car{brand_id: 2, name: "Aveo"}
    Cars.Car.changeset( %Cars.Car{}, Map.from_struct(car3))
  end

  def test_changeset_update do
    car = Cars.Car |> Ecto.Query.first |> Cars.Repo.one
    changeset = Cars.Car.changeset(car, %{model: 2017})
    Cars.Repo.update(changeset)
  end


  def test_queries do
    alias Cars.Car
    alias Cars.Repo

    car = Car |> Ecto.Query.first |> Repo.one
    IO.inspect(car)
    cars = Car |> Repo.all
    IO.inspect(cars)
    car_getby = Car |> Repo.get_by(model: 2019)
    IO.inspect(car_getby)
    car_model = Car |> Ecto.Query.where(model: 2017) |> Repo.all
    IO.inspect(car_model)
  end

  def test_assoc do
    import Ecto.Query, only: [first: 1]
    import Ecto, only: [assoc: 2]

    car = Cars.Car |> first |> Cars.Repo.one
    #require IEx; IEx.pry
    cars = Cars.Repo.all(assoc(car, :brand))
    IO.inspect(cars)
  end

  def test_preload do
    carst = Cars.Car |> Ecto.Query.where(brand_id: 2) |> Cars.Repo.all
    IO.inspect(carst)
    ans2 = Cars.Repo.preload(carst,[:brand])
    IO.inspect(ans2)
  end
end
