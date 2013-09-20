require 'nokogiri'

class ImageScrape
  class Parser
    class << self
      def parse(body, selector, attribute)
        doc = Nokogiri::HTML(body)

        doc.css(selector).map {|node| node.has_attribute?(attribute) ? node.attribute(attribute).to_s : nil}.compact
      end
    end
  end
end