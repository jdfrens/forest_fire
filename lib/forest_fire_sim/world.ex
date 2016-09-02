defmodule ForestFireSim.World do
  alias ForestFireSim.Forest

  def create(forest, fire_starter) do
    spawn_link(__MODULE__, :init, [forest, fire_starter])
  end

  def init(forest, fire_starter) do
    forest
    |> Forest.get_fires
    |> Enum.each(&(fire_starter.(&1)))
    loop(forest, fire_starter)
  end

  def loop(forest, fire_starter) do
    receive do
      {:advance_fire, xy} ->
        {forest, fires} = advance_fire(forest, xy)
        start_fires(fires, fire_starter)
        loop(forest, fire_starter)
      :render ->
        IO.puts Forest.to_string(forest)
        loop(forest, fire_starter)
      {:debug_location, xy, reply_to} ->
        debug_location(forest, xy, reply_to)
        loop(forest, fire_starter)
    end
  end

  defp advance_fire(forest, xy) do
    forest
    |> Forest.reduce_fire(xy)
    |> Forest.spread_fire(xy)
  end

  defp start_fires(fires, fire_starter) do
    Enum.each(fires, &(fire_starter.(&1)))
  end

  defp debug_location(forest, xy, reply_to) do
    cell = Forest.get_location(forest, xy)
    send reply_to, {:debug_location_response, cell}
  end
end
