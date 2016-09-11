# Jeremy's Version of JEG2's Forest Fire Simulation

I attended the awesome [SimAlchemy](http://elixirconf.com/2016/speakers.html#grayii) workshop from [James Edward Gray II](http://graysoftinc.com/) at ElixirConf2016.  It was a workshop on Elixir processes and OTP; we used them to build simulations.

This is my solution for a [forest-fire simulation that Gray started](https://github.com/JEG2/simulations/tree/master/forest_fire_sim).  The tests all pass, and the simulation works.  I've made my own additions and clean ups.  See the commits on this repo to see my changes.

## Running the tests

1. Clone this repo.
1. `mix deps.get`
1. `mix test`

## Running the simulation

1. Clone this repo.
1. `mix deps.get`
1. `iex -S mix`

Hit C-c C-c or C-\ to exit the simulation.
