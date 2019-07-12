# frozen_string_literal: true

module Geoextract
  module Exif
    module Type
      class Geoextract::Exif::Type::Caster
        def initialize(key, value)
          @key = key
          @value = value
        end

        def cast
          case @value.class.name
          when 'Array'
            @value
          when 'Rational'
            @value.to_f
          else
            @value
          end
        end
      end
    end
  end
end
