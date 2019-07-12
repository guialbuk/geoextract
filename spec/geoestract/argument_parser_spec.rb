# frozen_string_literal: true

RSpec.describe Geoextract::ArgumentParser do
  describe '--format argument' do
    it 'parses --format' do
      stub_const('ARGV', ['--format=csv'])

      expect(described_class.extract_options[:format]).
        to eq(:csv)
    end

    it 'parses --f' do
      stub_const('ARGV', ['--f=html'])

      expect(described_class.extract_options[:format]).
        to eq(:html)
    end

    it 'defaults to csv' do
      stub_const('ARGV', [])

      expect(described_class.extract_options[:format]).
        to eq(:csv)
    end

    it 'is case insensitive' do
      stub_const('ARGV', ['--f=HTML'])

      expect(described_class.extract_options[:format]).
        to eq(:html)
    end

    it 'raises exception for invalid value' do
      stub_const('ARGV', ['--f=aaa'])

      expect { described_class.extract_options }.
        to raise_error(OptionParser::InvalidArgument)
    end
  end

  describe '--directory argument' do
    it 'parses --directory' do
      stub_const('ARGV', ['--directory=images'])

      expect(described_class.extract_options[:directory]).
        to eq('images')
    end

    it 'parses --d' do
      stub_const('ARGV', ['--d=images'])

      expect(described_class.extract_options[:directory]).
        to eq('images')
    end

    it 'defaults to .' do
      stub_const('ARGV', [])

      expect(described_class.extract_options[:directory]).
        to eq('.')
    end
  end
end
