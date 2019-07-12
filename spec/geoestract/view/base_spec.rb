# frozen_string_literal: true

RSpec.describe Geoextract::View::Base do
  let(:unordered_image) do
    {
      foo: 0,
      image_path: 'path'
    }
  end

  let(:ordered_image) do
    {
      image_path: 'path',
      foo: 0
    }
  end

  it 'orders keys for all image hashes' do
    expect(described_class.new([unordered_image]).images).
      to eq([ordered_image])
  end
end
