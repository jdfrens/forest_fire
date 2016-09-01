defmodule ForestFireSim.Fire do
  def ignite(world, xy, intensity) do
    spawn_link(fn ->
      loop(world, xy, intensity)
    end)
  end

  def loop(_world, _xy, 0), do: nil
  def loop(world, xy, intensity) do
    receive do
      :advance ->
        send world, {:advance_fire, xy}
        loop(world, xy, intensity - 1)
    end
  end
end
