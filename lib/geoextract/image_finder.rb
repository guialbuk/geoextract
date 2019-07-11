# frozen_string_literal: true

module Geoextract
  class ImageFinder
    def initialize(directory)
      @directory = directory
    end

    def find_recursively
      Find.
        find(absolute_path).
        select(&method(:image?))
    end

    private

    def absolute_path
      File.expand_path(@directory)
    end

    def image?(file)
      MIME::Types.
        type_for(file).
        map(&:media_type).
        include?('image')
    end
  end
end
