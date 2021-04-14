import Config

config :libcluster,
  topologies: [
    _: [
      strategy: Elixir.Cluster.Strategy.Kubernetes.DNS,
      config: [
        service: "rasmus-headless",
        application_name: "rasmus",
        polling_interval: 10_000
      ]
    ]
  ]
