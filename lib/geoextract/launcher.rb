# frozen_string_literal: true

module Geoextract
  class Launcher
    def self.launch
      ArgumentParser.extract_options
    end
  end
end
