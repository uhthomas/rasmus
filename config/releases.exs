import Config

config :libcluster,
  topologies: [
    _: [
      strategy: Elixir.Cluster.Strategy.Kubernetes.DNSSRV,
      config: [
        namespace: System.fetch_env!("NAMESPACE"),
        service: System.fetch_env!("SERVICE"),
        application_name: System.fetch_env!("APP"),
        polling_interval: 10_000
      ]
    ]
  ]
