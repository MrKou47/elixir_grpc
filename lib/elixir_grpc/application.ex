defmodule ElixirGrpc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ElixirGrpc.Worker.start_link(arg)
      # {ElixirGrpc.Worker, arg}
      UserDB,
      {GRPC.Server.Supervisor, {Interface.Endpoint, 50051}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirGrpc.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
