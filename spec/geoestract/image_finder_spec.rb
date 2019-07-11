# frozen_string_literal: true

RSpec.describe Geoextract::ImageFinder do
  describe 'find files' do
    it 'from absolute path' do
      absolute_path = File.expand_path('../support/images', __dir__)

      expect(described_class.new(absolute_path).find_recursively.count).
        to eq(5)
    end

    it 'from relative path' do
      relative_path = 'spec/support/images'

      expect(described_class.new(relative_path).find_recursively.count).
        to eq(5)
    end
  end
end
