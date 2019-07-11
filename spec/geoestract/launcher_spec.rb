# frozen_string_literal: true

RSpec.describe Geoextract::Launcher do
  it 'extracts options' do
    expect(Geoextract::ArgumentParser).
      to receive(:extract_options).
      and_call_original

    described_class.launch
  end
end
