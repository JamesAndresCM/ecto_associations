defmodule Streamovies.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      StreamoviesWeb.Telemetry,
      # Start the Ecto repository
      Streamovies.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Streamovies.PubSub},
      # Start Finch
      {Finch, name: Streamovies.Finch},
      # Start the Endpoint (http/https)
      StreamoviesWeb.Endpoint
      # Start a worker by calling: Streamovies.Worker.start_link(arg)
      # {Streamovies.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Streamovies.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StreamoviesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
