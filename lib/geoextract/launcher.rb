# frozen_string_literal: true

module Geoextract
  class Launcher
    class << self
      def launch
        options = ArgumentParser.extract_options
        images  = image_paths(options)

        puts extract_gps_data(images)
      end

      private

      def image_paths(options)
        ImageFinder.
          new(options[:directory]).
          find_recursively
      end

      def extract_gps_data(images)
        Exif::Extractor.extract_all(images)
      end
    end
  end
end
