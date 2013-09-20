$: << File.join(File.dirname(__FILE__), "..", "lib")

require 'image_scrape'

if ARGV.size < 2
  puts "usage: ruby image-scrape.rb url selector <output-dir>"
end

url = ARGV[0]
selector = ARGV[1]
output = ARGV[2] ? ARGV[2] : "."

ImageScrape.run(ARGV[0], selector, ImageScrape::Storage::FileSystem.new(output))