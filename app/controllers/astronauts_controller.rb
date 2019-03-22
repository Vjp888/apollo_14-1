class AstronautsController < ApplicationController
  def index
    @astros = Astronaut.all
    @average_age = Astronaut.average_age
  end
end
