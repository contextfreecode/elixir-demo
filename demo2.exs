# From https://hexdocs.pm/elixir/Supervisor.html
defmodule Stack do
  use GenServer

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

children = [{Stack, [:hello]}]
{:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)
# After started, we can query the supervisor for information
IO.inspect Supervisor.count_children(pid)

IO.inspect GenServer.call(Stack, :pop)

IO.inspect GenServer.cast(Stack, {:push, :world})
IO.inspect GenServer.call(Stack, :pop)

# IO.inspect GenServer.call(Stack, :pop)

# IO.inspect GenServer.call(Stack, :pop)
