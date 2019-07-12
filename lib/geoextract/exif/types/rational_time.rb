# frozen_string_literal: true

module Geoextract
  module Exif
    module Type
      class RationalTime
        def self.cast(value)
          hours   = RationalCoordinates.cast(value)
          minutes = (hours.modulo(1) * 60)
          seconds = (minutes.modulo(1) * 60)

          "#{hours.to_i}:#{minutes.to_i}:#{seconds.to_i}"
        end
      end
    end
  end
end
