# frozen_string_literal: true

module Geoextract
  module Exif
    class Extractor
      def initialize(absolute_path)
        @absolute_path = absolute_path
      end

      def extract_gps_data
        cast_values(gps_data)

      rescue ::Exif::NotReadable
        {}
      end

      private

      def gps_data
        ::Exif::Data.new(file)[:gps]
      end

      def cast_values(gps_data)
        {}.tap do |data|
          gps_data.each do |key, value|
            data[key] = Type::Caster.new(key, value).cast
          end
        end
      end

      def file
        IO.read(@absolute_path)
      end
    end
  end
end
