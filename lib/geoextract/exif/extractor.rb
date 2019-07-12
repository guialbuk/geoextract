# frozen_string_literal: true

module Geoextract
  module Exif
    class Extractor
      def self.extract_all(paths)
        paths.map { |path| new(path).extract_gps_data }
      end

      def initialize(absolute_path)
        @absolute_path = absolute_path
      end

      def extract_gps_data
        inject_image_path(
          cast_values(
            gps_data
          )
        )
      end

      private

      def inject_image_path(gps_hash)
        gps_hash.merge(
          image_path: @absolute_path
        )
      end

      def cast_values(gps_data)
        {}.tap do |data|
          gps_data.each do |key, value|
            data[key] = Type::Caster.new(key, value).cast
          end
        end
      end

      def gps_data
        ::Exif::Data.new(file)[:gps]
      rescue ::Exif::NotReadable
        {}
      end

      def file
        IO.read(@absolute_path)
      end
    end
  end
end
