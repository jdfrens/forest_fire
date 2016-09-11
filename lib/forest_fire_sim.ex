defmodule ForestFireSim do
  alias ForestFireSim.{Fire, Forest, World}

  @interval 500

  def start do
    {:ok, width}  = :io.columns
    {:ok, height} = :io.rows
    forest = Forest.generate(%{width: width, height: height, percent: 66})
    world  = World.create(forest, &fire_starter/1)
    :timer.send_interval(@interval, world, :render)
  end

  def fire_starter({xy, intensity}) do
    fire = Fire.ignite(self, xy, intensity)
    :timer.send_interval(@interval, fire, :advance)
  end
end
