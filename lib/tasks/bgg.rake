require 'bgg_importer'

namespace :bgg do
  desc "Import BGG's top 100"
  task import: :environment do
    importer = BggImporter.new
    importer.import
  end
end
