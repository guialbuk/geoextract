# frozen_string_literal: true

module Geoextract
  module Exif
    module Type
      class RationalCoordinates
        def self.cast(value)
          degrees = value[0]
          minutes = value[1]
          seconds = value[2]

          degrees + minutes / 60.0 + seconds / 3600.0
        end
      end
    end
  end
end
