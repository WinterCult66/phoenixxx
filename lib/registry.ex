defmodule Phoenixxx.Registry do
  use GenServer
  import Phoenixxx.HelperTopic

  # @interval 5 * 60 * 1000

  @impl true
  def init(_) do
    # Process.send_after(self(), :call_free_service, @interval)
    set = MapSet.new()
    {:ok, set}
  end

  @impl true
  def handle_call({:lookup, name}, _from, map_names) do
    # {:reply, resultado de la busqueda, mapa }
    # sync
    {:reply, Map.fetch(map_names, name), map_names}
  end

  # def handle_call({:lookup_2, name}, _from, map_names) do
  #   #{:reply, resultado de la busqueda, mapa }
  #   {:reply, Map.fetch(map_names, name), map_names} #sync
  # end
  # def handle_call({:lookup_3, name}, _from, map_names) do
  #   #{:reply, resultado de la busqueda, mapa }
  #   {:reply, Map.fetch(map_names, name), map_names} #sync
  # end

  @impl true
  def handle_cast({:create, topic}, _) do
    result = create_topic(topic)
    {:noreply, result}
  end

  @impl true
  def handle_cast({:update, id, map}, _) do
    result =
      get_topic!(id)
      |> update_topic(map)

    {:noreply, result}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  def create(server, map) do
    GenServer.cast(server, map)
  end
end
