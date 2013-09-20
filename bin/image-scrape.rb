$: << File.join(File.dirname(__FILE__), "..", "lib")

require 'image_scrape'

if ARGV.size < 3
  puts "usage: ruby image-scrape.rb url selector <output-dir>"
end

url = ARGV[0]
selector = ARGV[1]
attribute = ARGV[2]
output = ARGV[3] ? ARGV[3] : "."

ImageScrape.run(url, selector, attribute, ImageScrape::Storage::FileSystem.new(output))