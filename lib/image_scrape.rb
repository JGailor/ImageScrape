$: << "."

require 'image_scrape/fetcher'
require 'image_scrape/parser'
require "image_scrape/storage"

class ImageScrape
  class << self
    def run(url, selector, storage = ImageScrape::Storage::FileSystem.new)
      results = ImageScrape::Fetcher.fetch(url)
      images = ImageScrape::Parser.parse(results, selector)

      images.each do |image|
        begin
          img = ImageScrape::Fetcher.fetch(image)
          storage.store(image.split("/").last, img)
        rescue
          puts "Could not fetch '#{image}'"
        end
      end
    end 
  end
end