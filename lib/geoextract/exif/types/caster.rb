# frozen_string_literal: true

require 'geoextract/exif/types/version'

module Geoextract
  module Exif
    module Type
      class Caster
        TYPES = {
          gps_version_id: Version
        }.freeze

        def initialize(key, value)
          @key = key
          @value = value
        end

        def cast
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
