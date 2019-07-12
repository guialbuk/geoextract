# frozen_string_literal: true

RSpec.describe Geoextract::View::CSV do
  let(:images) do
    [
      {
        bar: 1,
        image_path: 'path1'
      },
      {
        foo: ',',
        image_path: 'path2'
      }
    ]
  end

  let(:csv) do
    <<~CSV
      image_path,bar,foo
      path1,1,
      path2,,","
    CSV
  end

  it 'generates CSV string' do
    expect(described_class.new(images).render).
      to eq(csv)
  end
end
