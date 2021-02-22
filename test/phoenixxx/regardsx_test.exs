defmodule Phoenixxx.RegardsxTest do
  use Phoenixxx.DataCase

  alias Phoenixxx.Regardsx

  describe "regards" do
    alias Phoenixxx.Regardsx.Regards

    @valid_attrs %{regard: "some regard", regardN: 42}
    @update_attrs %{regard: "some updated regard", regardN: 43}
    @invalid_attrs %{regard: nil, regardN: nil}

    def regards_fixture(attrs \\ %{}) do
      {:ok, regards} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Regardsx.create_regards()

      regards
    end

    test "list_regards/0 returns all regards" do
      regards = regards_fixture()
      assert Regardsx.list_regards() == [regards]
    end

    test "get_regards!/1 returns the regards with given id" do
      regards = regards_fixture()
      assert Regardsx.get_regards!(regards.id) == regards
    end

    test "create_regards/1 with valid data creates a regards" do
      assert {:ok, %Regards{} = regards} = Regardsx.create_regards(@valid_attrs)
      assert regards.regard == "some regard"
      assert regards.regardN == 42
    end

    test "create_regards/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Regardsx.create_regards(@invalid_attrs)
    end

    test "update_regards/2 with valid data updates the regards" do
      regards = regards_fixture()
      assert {:ok, %Regards{} = regards} = Regardsx.update_regards(regards, @update_attrs)
      assert regards.regard == "some updated regard"
      assert regards.regardN == 43
    end

    test "update_regards/2 with invalid data returns error changeset" do
      regards = regards_fixture()
      assert {:error, %Ecto.Changeset{}} = Regardsx.update_regards(regards, @invalid_attrs)
      assert regards == Regardsx.get_regards!(regards.id)
    end

    test "delete_regards/1 deletes the regards" do
      regards = regards_fixture()
      assert {:ok, %Regards{}} = Regardsx.delete_regards(regards)
      assert_raise Ecto.NoResultsError, fn -> Regardsx.get_regards!(regards.id) end
    end

    test "change_regards/1 returns a regards changeset" do
      regards = regards_fixture()
      assert %Ecto.Changeset{} = Regardsx.change_regards(regards)
    end
  end
end
