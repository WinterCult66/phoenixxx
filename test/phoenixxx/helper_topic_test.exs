defmodule Phoenixxx.HelperTopicTest do
  use Phoenixxx.DataCase

  alias Phoenixxx.HelperTopic

  describe "topic" do
    alias Phoenixxx.HelperTopic.Topic

    @valid_attrs %{description: "some description", growth: "some growth", title: "some title"}
    @update_attrs %{description: "some updated description", growth: "some updated growth", title: "some updated title"}
    @invalid_attrs %{description: nil, growth: nil, title: nil}

    def topic_fixture(attrs \\ %{}) do
      {:ok, topic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HelperTopic.create_topic()

      topic
    end

    test "list_topic/0 returns all topic" do
      topic = topic_fixture()
      assert HelperTopic.list_topic() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert HelperTopic.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      assert {:ok, %Topic{} = topic} = HelperTopic.create_topic(@valid_attrs)
      assert topic.description == "some description"
      assert topic.growth == "some growth"
      assert topic.title == "some title"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HelperTopic.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{} = topic} = HelperTopic.update_topic(topic, @update_attrs)
      assert topic.description == "some updated description"
      assert topic.growth == "some updated growth"
      assert topic.title == "some updated title"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = HelperTopic.update_topic(topic, @invalid_attrs)
      assert topic == HelperTopic.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = HelperTopic.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> HelperTopic.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = HelperTopic.change_topic(topic)
    end
  end
end
