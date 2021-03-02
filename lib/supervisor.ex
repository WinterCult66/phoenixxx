defmodule Phoenixxx.Supervisor do
  use Supervisor

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {Registry, name: Registry}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
