defmodule Rasmus.MixProject do
  use Mix.Project

  def project do
    [
      app: :rasmus,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Rasmus.Application, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 2.8"},
      {:libcluster, "~> 3.2"},
      {:phoenix_pubsub, "~> 2.0"},
      {:poison, "~> 4.0"}
    ]
  end
end
