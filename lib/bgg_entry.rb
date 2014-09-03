class BggEntry
  ANCHOR_SELECTOR = "a[href*=boardgame]"
  YEAR_SELECTOR = "td:nth-of-type(3) span"

  def initialize(entry)
    @entry = entry
  end

  def details
    {
      title: title,
      bgg_id: bgg_id,
      year: year
    }
  end

  private
  attr_reader :entry

  def title
    entry.css(ANCHOR_SELECTOR).text.strip
  end

  def bgg_id
    entry.css(ANCHOR_SELECTOR)[0]["href"].split("/")[2]
  end

  def year
    entry.css(YEAR_SELECTOR).text.tr("^0-9", "")
  end
end
