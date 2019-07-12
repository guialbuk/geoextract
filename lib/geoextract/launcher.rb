# frozen_string_literal: true

module Geoextract
  class Launcher
    def self.launch
      options = ArgumentParser.extract_options

      images =
        ImageFinder.
          new(options[:directory]).
          find_recursively

      images.each { |i| puts i }
    end
  end
end
