defmodule Job.Task do
  import Phoenixxx.Regardsx
  def print() do
    regard = last_regard()
    numb = cond do
      is_nil(regard) -> 0
      np -> regard.regardN+1
    end
    create_regards(%{regard: "Hola", regardN: numb })
  end
end
