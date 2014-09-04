class GamesController < ApplicationController
  def initialize
    @games = Game.limit(100)
  end
end
