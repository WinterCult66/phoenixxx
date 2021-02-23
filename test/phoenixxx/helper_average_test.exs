defmodule Phoenixxx.HelperAverageTest do
  use Phoenixxx.DataCase

  alias Phoenixxx.HelperAverage

  describe "average" do
    alias Phoenixxx.HelperAverage.Average

    @valid_attrs %{average_of_page: "some average_of_page", name_of_avg: "some name_of_avg"}
    @update_attrs %{
      average_of_page: "some updated average_of_page",
      name_of_avg: "some updated name_of_avg"
    }
    @invalid_attrs %{average_of_page: nil, name_of_avg: nil}

    def average_fixture(attrs \\ %{}) do
      {:ok, average} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HelperAverage.create_average()

      average
    end

    test "list_average/0 returns all average" do
      average = average_fixture()
      assert HelperAverage.list_average() == [average]
    end

    test "get_average!/1 returns the average with given id" do
      average = average_fixture()
      assert HelperAverage.get_average!(average.id) == average
    end

    test "create_average/1 with valid data creates a average" do
      assert {:ok, %Average{} = average} = HelperAverage.create_average(@valid_attrs)
      assert average.average_of_page == "some average_of_page"
      assert average.name_of_avg == "some name_of_avg"
    end

    test "create_average/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HelperAverage.create_average(@invalid_attrs)
    end

    test "update_average/2 with valid data updates the average" do
      average = average_fixture()
      assert {:ok, %Average{} = average} = HelperAverage.update_average(average, @update_attrs)
      assert average.average_of_page == "some updated average_of_page"
      assert average.name_of_avg == "some updated name_of_avg"
    end

    test "update_average/2 with invalid data returns error changeset" do
      average = average_fixture()
      assert {:error, %Ecto.Changeset{}} = HelperAverage.update_average(average, @invalid_attrs)
      assert average == HelperAverage.get_average!(average.id)
    end

    test "delete_average/1 deletes the average" do
      average = average_fixture()
      assert {:ok, %Average{}} = HelperAverage.delete_average(average)
      assert_raise Ecto.NoResultsError, fn -> HelperAverage.get_average!(average.id) end
    end

    test "change_average/1 returns a average changeset" do
      average = average_fixture()
      assert %Ecto.Changeset{} = HelperAverage.change_average(average)
    end
  end
end
