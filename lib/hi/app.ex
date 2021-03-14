defmodule Hi.App do
  use Application

  def start(_type, _args) do
    children = [{Hi.Stack, [:hi]}]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
