# frozen_string_literal: true

module Geoextract
  module Exif
    module Type
      class RationalTime
        def self.cast(value)
          float_time = RationalCoordinates.cast(value)

          Time.
            at(float_time).
            utc.
            iso8601
        end
      end
    end
  end
end
