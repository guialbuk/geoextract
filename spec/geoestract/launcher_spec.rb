# frozen_string_literal: true

RSpec.describe Geoextract::Launcher do
  let(:directory) { File.expand_path('../support/images', __dir__) }

  before(:each) { stub_const('ARGV', ["-d#{directory}"]) }
  before(:each) { allow(STDOUT).to receive(:puts) }

  it 'extracts options' do
    expect(Geoextract::ArgumentParser).
      to receive(:extract_options).
      and_call_original

    described_class.launch
  end

  it 'finds images recursively' do
    expect_any_instance_of(Geoextract::ImageFinder).
      to receive(:find_recursively).
      and_call_original

    described_class.launch
  end
end
