# frozen_string_literal: true

module Geoextract
  module View
    class Base
      attr_reader :images

      ORDERED_KEYS = %i[
        image_path
        gps_latitude_ref
        gps_latitude
        gps_longitude_ref
        gps_longitude
      ].freeze

      def initialize(images)
        @images = order_keys(images)
      end

      private

      def order_keys(images)
        images.map(&method(:order_image_keys))
      end

      def order_image_keys(image)
        {}.tap do |ordered|
          ORDERED_KEYS.each do |key|
            ordered[key] = image[key] if image[key]
          end
        end.merge(image)
      end
    end
  end
end
