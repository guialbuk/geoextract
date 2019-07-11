# frozen_string_literal: true

module Geoextract
  class ImageFinder
    def initialize(directory)
      @directory = directory
    end

    def find_recursively
      Find.
        find(absolute_path).
        reject(&method(:directory?)).
        select(&method(:image_extension))
    end

    private

    def absolute_path
      File.expand_path(@directory)
    end

    def directory?(file)
      File.directory?(file)
    end

    def image_extension(file)
      file.match(/(jpg|jpeg)\z/i)
    end
  end
end
