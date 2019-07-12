# frozen_string_literal: true

module Geoextract
  module Exif
    module Type
      class Version
        def self.cast(value)
          value.
            map(&:to_s).
            join('.')
        end
      end
    end
  end
end
