defmodule ForestFireSim.Fire do
  def ignite(world, xy, intensity) do
    spawn_link(__MODULE__, :loop, [world, xy, intensity])
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
