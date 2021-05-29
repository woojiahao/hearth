defmodule Hearth.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    # Ensure that HTTPoison and its dependencies are loaded
    HTTPoison.start()

    children = [
      # Start the Telemetry supervisor
      HearthWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hearth.PubSub},
      # Start the Endpoint (http/https)
      HearthWeb.Endpoint
      # Start a worker by calling: Hearth.Worker.start_link(arg)
      # {Hearth.Worker, arg}
    ]

    opts = [strategy: :one_for_one, name: Hearth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    HearthWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
