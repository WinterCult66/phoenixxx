defmodule ExplodingTopics2 do
  import Util
  import Phoenixxx.HelperTopic

  def task_of_topics() do
    topic_info_container = construct_document()

    for topic <- topic_info_container do
      analazing_topic(topic)
    end
  end

  defp construct_document() do
    document = get_document("https://explodingtopics.com/")
    {:ok, body} = Floki.parse_document(document)
    Floki.find(body, ".topicInfoContainer")
  end

  defp analazing_topic(topic) do
    [{_, _, [title]}] = Floki.find(topic, ".tileKeyword")
    [{_, _, [growth]}] = Floki.find(topic, ".scoreTagGradient")
    [{_, _, [description]}] = Floki.find(topic, ".tileDescription")
    object = load_object_by_title("#{title}")
    growth_tmp = if object != nil, do: object.growth, else: nil

    cond do
      growth_tmp == nil ->
        create_topic(%{title: title, growth: "#{growth}", description: description})

      growth_tmp != nil and growth_tmp != growth ->
        get_topic!(object.id) |> update_topic(%{growth: "#{growth}"})

      growth_tmp != nil ->
        IO.puts("")
    end
  end
end
