defmodule Rasmus.WebSocket do
  alias Phoenix.PubSub

  require Logger

  def init(req, state),
    do:
      {:cowboy_websocket, req, state,
       %{
         idle_timeout: 30_000,
         max_frame_size: 32_768
       }}

  def websocket_init(state) do
    :timer.send_interval(5000, :ping)

    {:ok, hostname} = :inet.gethostname()

    PubSub.subscribe(:rasmus, "global")
    {[{:text, "Hi! You're connected to #{hostname}."}], state, :hibernate}
  end

  def websocket_handle({:text, data}, state) do
    {:ok, hostname} = :inet.gethostname()

    PubSub.broadcast(:rasmus, "global", {:hello, {hostname, data}})
    {[], state, :hibernate}
  end

  def websocket_handle(:pong, state), do: {[], state, :hibernate}

  def websocket_info({:hello, {hostname, data}}, state),
    do: {[{:text, "#{hostname}: #{data}"}], state, :hibernate}

  def websocket_info(:ping, state), do: {[:ping], state, :hibernate}

  def terminate(reason, _partial_req, _state) do
    Logger.info("terminate: reason: #{inspect(reason)}")
    :ok
  end
end
