# frozen_string_literal: true

module Geoextract
  module Exif
    module Type
      class Rational
        def self.cast(value)
          value.to_f
        end
      end
    end
  end
end
