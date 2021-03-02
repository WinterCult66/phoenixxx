defmodule PhoenixxxWeb.TopicLive do

  import Phoenixxx.HelperTopic
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <table>
    <thead>
      <tr>
        <th>Title</th>
        <th>Growth</th>
        <th>Description</th>
        <th>Update DateTime</th>

      </tr>
    </thead>
    <tbody>
  <%= for topic <- @topic do %>
      <tr>
        <td><%= topic.title %></td>
        <td><%= topic.growth %></td>
        <td><%= topic.description %></td>
        <td><%= topic.updated_at %></td>


      </tr>
  <% end %>
    </tbody>
  </table>
    """
  end


  def mount(_params, _, socket) do

    if connected?(socket), do: Process.send_after(self(), :update, 30000)
    topic = list_topic()
    {:ok, assign(socket, topic: topic)}
    end

    def handle_info(:update, socket) do
      Process.send_after(self(), :update, 30000)
      topic = list_topic()
      {:noreply, assign(socket, topic: topic)}
    end




end
