require 'rest-client'

class ImageScrape
  class Fetcher
    attr_reader :options

    def initialize(options = {})
      @options = options

      @options.merge!{user_agent: "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.17 Safari/537.36"}
    end

    def fetch(url)
      RestClient.get(url, :user_agent => options[:user_agent])
    end
  end
end