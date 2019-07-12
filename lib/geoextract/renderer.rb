# frozen_string_literal: true

require 'geoextract/view/base'
require 'geoextract/view/csv'
require 'geoextract/view/html'

module Geoextract
  class Renderer
    VIEWS = {
      csv: View::CSV,
      html: View::HTML
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
