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

    PubSub.subscribe(:rasmus, "global")
    {[], state, :hibernate}
  end

  def websocket_handle({:text, data}, state) do
    PubSub.broadcast(:rasmus, "global", {:hello, data})
    {[], state, :hibernate}
  end

  def websocket_handle(:pong, state), do: {[], state, :hibernate}

  def websocket_info({:hello, data}, state),
    do: {[{:text, Poison.encode!(data)}], state, :hibernate}

  def websocket_info(:ping, state), do: {[:ping], state, :hibernate}

  def terminate(reason, _partial_req, _state) do
    Logger.info("terminate: reason: #{inspect(reason)}")
    :ok
  end
end
