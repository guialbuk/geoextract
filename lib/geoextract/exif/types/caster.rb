# frozen_string_literal: true

require 'geoextract/exif/types/rational'
require 'geoextract/exif/types/rational_coordinates'
require 'geoextract/exif/types/rational_time'
require 'geoextract/exif/types/version'

module Geoextract
  module Exif
    module Type
      class Caster
        TYPES = {
          gps_altitude:   Rational,
          gps_latitude:   RationalCoordinates,
          gps_longitude:  RationalCoordinates,
          gps_time_stamp: RationalTime,
          gps_version_id: Version
        }.freeze

        def initialize(key, value)
          @key = key
          @value = value
        end

        def cast
          return unless @value

          klass = TYPES[@key]

          if klass
            klass.cast(@value)
          else
            @value
          end
        end
      end
    end
  end
end
