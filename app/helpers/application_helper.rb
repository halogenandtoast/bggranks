module ApplicationHelper
  def bgg_link_to game
    link_to game.title, "http://boardgamegeek.com/boardgame/#{game.bgg_id}"
  end
end
