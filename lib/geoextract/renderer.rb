# frozen_string_literal: true

require 'geoextract/view/base'
require 'geoextract/view/csv'

module Geoextract
  class Renderer
    VIEWS = {
      csv: View::CSV
    }.freeze

    def initialize(images, format)
      @images = images
      @format = format
    end

    def render
      VIEWS[@format].
        new(@images).
        render
    end
  end
end
