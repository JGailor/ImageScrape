$: << "."

require 'image_scrape/fetcher'
require 'image_scrape/parser'
require "image_scrape/storage"

class ImageScrape
  class << self
    def run(url, selector, attribute, storage = ImageScrape::Storage::FileSystem.new)
      fetcher = ImageScrape::Fetcher.new()
      
      results = fetcher.fetch(url)
      
      images = ImageScrape::Parser.parse(results, selector, attribute)

      images.each do |image|
        begin
          img = fetcher.fetch(image)
          storage.store(image.split("/").last, img)
        rescue
          puts "Could not fetch '#{image}'"
        end
      end
    end 
  end
end