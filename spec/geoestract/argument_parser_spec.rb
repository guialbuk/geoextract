# frozen_string_literal: true

RSpec.describe Geoextract::ArgumentParser do
  context '--format argument' do
    it 'parses --format' do
      stub_const('ARGV', ['--format=csv'])

      expect(described_class.extract_options).
        to eq(format: 'csv')
    end

    it 'parses --f' do
      stub_const('ARGV', ['--f=html'])

      expect(described_class.extract_options).
        to eq(format: 'html')
    end

    it 'defaults to csv' do
      stub_const('ARGV', [])

      expect(described_class.extract_options).
        to eq(format: 'csv')
    end

    it 'is case insensitive' do
      stub_const('ARGV', ['--f=HTML'])

      expect(described_class.extract_options).
        to eq(format: 'html')
    end

    it 'raises exception for invalid value' do
      stub_const('ARGV', ['--f=aaa'])

      expect {described_class.extract_options }.
        to raise_error(OptionParser::InvalidArgument)
    end
  end
end
