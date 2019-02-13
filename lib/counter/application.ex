defmodule Counter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Counter.One,
      Counter.Two,
      Counter.Three
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Counter.Supervisor]
    # opts = [strategy: :rest_for_one, name: Counter.Supervisor]
    # opts = [strategy: :one_for_all, name: Counter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
