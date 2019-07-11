# frozen_string_literal: true

RSpec.describe Geoextract::ImageFinder do
  describe 'find images' do
    let(:relative_path) { 'spec/support/images' }

    it 'from relative path' do
      expect(described_class.new(relative_path).find_recursively.count).
        to eq(5)
    end

    it 'from absolute path' do
      absolute_path = File.expand_path('../support/images', __dir__)

      expect(described_class.new(absolute_path).find_recursively.count).
        to eq(5)
    end

    it 'includes image files' do
      expect(described_class.new(relative_path).find_recursively).
        to include(/\.jpg/)
    end

    it 'excludes non-image files' do
      expect(described_class.new(relative_path).find_recursively).
        not_to include(/\.txt/)
    end
  end
end
