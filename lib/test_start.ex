defmodule TestStart do
  require Ecto.Query

  def test_insert_car do
    car = %Cars.Car{brand_id: 2, name: "Optra", model: 2019, owner: "Pepe Romero"}
    Cars.Repo.insert(car)
    car2 = %Cars.Car{brand_id: 2, name: "Aveo", model: 2010, owner: "Daniel Perez"}
    Cars.Repo.insert(car2)
  end

  def test_changeset_error do
    car3 = %Cars.Car{brand_id: 2, name: "Aveo"}
    Cars.Car.changeset(car3, %{})
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
    car_model = Car |> Ecto.Query.where(model: 2019) |> Repo.all
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
