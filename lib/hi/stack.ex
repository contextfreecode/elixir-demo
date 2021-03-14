# From https://hexdocs.pm/elixir/Supervisor.html
defmodule Hi.Stack do
  use GenServer

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  ## Callbacks

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, head}, tail) do
    {:noreply, [head | tail]}
  end
end
