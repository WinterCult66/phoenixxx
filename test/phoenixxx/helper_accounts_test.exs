defmodule Phoenixxx.HelperAccountsTest do
  use Phoenixxx.DataCase

  alias Phoenixxx.HelperAccounts

  describe "superregards" do
    alias Phoenixxx.HelperAccounts.SuperRegards

    @valid_attrs %{regard: "some regard"}
    @update_attrs %{regard: "some updated regard"}
    @invalid_attrs %{regard: nil}

    def super_regards_fixture(attrs \\ %{}) do
      {:ok, super_regards} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HelperAccounts.create_super_regards()

      super_regards
    end

    test "list_superregards/0 returns all superregards" do
      super_regards = super_regards_fixture()
      assert HelperAccounts.list_superregards() == [super_regards]
    end

    test "get_super_regards!/1 returns the super_regards with given id" do
      super_regards = super_regards_fixture()
      assert HelperAccounts.get_super_regards!(super_regards.id) == super_regards
    end

    test "create_super_regards/1 with valid data creates a super_regards" do
      assert {:ok, %SuperRegards{} = super_regards} = HelperAccounts.create_super_regards(@valid_attrs)
      assert super_regards.regard == "some regard"
    end

    test "create_super_regards/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HelperAccounts.create_super_regards(@invalid_attrs)
    end

    test "update_super_regards/2 with valid data updates the super_regards" do
      super_regards = super_regards_fixture()
      assert {:ok, %SuperRegards{} = super_regards} = HelperAccounts.update_super_regards(super_regards, @update_attrs)
      assert super_regards.regard == "some updated regard"
    end

    test "update_super_regards/2 with invalid data returns error changeset" do
      super_regards = super_regards_fixture()
      assert {:error, %Ecto.Changeset{}} = HelperAccounts.update_super_regards(super_regards, @invalid_attrs)
      assert super_regards == HelperAccounts.get_super_regards!(super_regards.id)
    end

    test "delete_super_regards/1 deletes the super_regards" do
      super_regards = super_regards_fixture()
      assert {:ok, %SuperRegards{}} = HelperAccounts.delete_super_regards(super_regards)
      assert_raise Ecto.NoResultsError, fn -> HelperAccounts.get_super_regards!(super_regards.id) end
    end

    test "change_super_regards/1 returns a super_regards changeset" do
      super_regards = super_regards_fixture()
      assert %Ecto.Changeset{} = HelperAccounts.change_super_regards(super_regards)
    end
  end
end
