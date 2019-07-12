# frozen_string_literal: true

module Geoextract
  module Exif
    class Extractor
      def initialize(absolute_path)
        @absolute_path = absolute_path
      end

      def extract_gps_data
        ::Exif::Data.new(file)[:gps]
      rescue ::Exif::NotReadable
        {}
      end

      private

      def file
        IO.read(@absolute_path)
      end
    end
  end
end
