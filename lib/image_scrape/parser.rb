require 'nokogiri'

class ImageScrape
  class Parser
    class << self
      def parse(body, selector)
        doc = Nokogiri::HTML(body)

        doc.css(selector).map {|node| node.has_attribute?("src") ? node.attribute("src").to_s : nil}.compact
      end
    end
  end
end