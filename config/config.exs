import Config

config :cars, ecto_repos: [Cars.Repo]

config :cars, Cars.Repo,
  database: "cars_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
