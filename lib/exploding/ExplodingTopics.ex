defmodule ExplodingTopics2 do
  import Util
  import Phoenixxx.HelperTopic

  def task_of_topics() do
    document = get_document("https://explodingtopics.com/")
    {:ok, body} = Floki.parse_document(document)
    topic_info_container = Floki.find(body,".topicInfoContainer")

    for topic <- topic_info_container do
      [{_,_,[title]}] =  Floki.find(topic, ".tileKeyword")
      [{_,_,[growth]}] =  Floki.find(topic, ".scoreTagGradient")
      [{_,_,[description]}] =  Floki.find(topic, ".tileDescription")
      object = load_object_by_title("#{title}")
      growth_tmp =  if object != nil, do: object.average_of_page, else: nil
      cond do
        growth_tmp == nil -> create_topic(%{title: title, growth: "#{growth}", description: description})
        growth_tmp != nil and (growth_tmp != growth) -> IO.puts("existe y cambio")
        growth_tmp != nil -> IO.puts("")
      end
    end
  end

end
