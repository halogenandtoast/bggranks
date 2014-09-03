require 'nokogiri'
require 'open-uri'
require 'bgg_entry'

class BggImporter
  BASE_URL = "http://boardgamegeek.com/browse/boardgame"
  ENTRIES_SELECTOR = "#collectionitems tr[id]"

  def import
    import_games
  end

  private

  def import_games
    game_details.each { |details| import_game(details) }
  end

  def import_game(details)
    Game.find_or_create_by(bgg_id: details[:bgg_id]) do |game|
      game.attributes = details
    end
  end

  def page
    @page ||= Nokogiri::HTML(open(BASE_URL))
  end

  def game_details
    page.css(ENTRIES_SELECTOR).map { |entry| BggEntry.new(entry).details }
  end
end
