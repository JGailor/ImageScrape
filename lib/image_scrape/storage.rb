class ImageScrape
  class Storage
    class FileSystem
      attr_reader :directory

      def initialize(directory = ".")
        @directory = directory
      end

      def store(fname, content)
        File.open(File.join(directory, fname), "wb") do |file|
          file.write(content)
        end
      end
    end
  end
end