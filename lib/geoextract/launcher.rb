# frozen_string_literal: true

module Geoextract
  class Launcher
    class << self
      def launch
        options = ArgumentParser.extract_options
        images  = image_paths(options)
        gps_data = extract_gps_data(images)

        puts render(gps_data, options)
      end

      private

      def render(gps_data, options)
        Renderer.
          new(gps_data, options[:format]).
          render
      end

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
