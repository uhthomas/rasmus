defmodule Rasmus.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Cluster.Supervisor,
       [Application.get_env(:libcluster, :topologies), [name: Rasmus.ClusterSupervisor]]},
      {Phoenix.PubSub, name: :rasmus}
    ]

    opts = [strategy: :one_for_one, name: Rasmus.Supervisor]
    Supervisor.start_link(children, opts)

    dispatch =
      :cowboy_router.compile([
        {:_,
         [
           {"/", Rasmus.WebSocket, []}
         ]}
      ])

    {:ok, _} =
      :cowboy.start_clear(:rasmus, [{:port, 8080}], %{
        env: %{dispatch: dispatch}
      })
  end
end
