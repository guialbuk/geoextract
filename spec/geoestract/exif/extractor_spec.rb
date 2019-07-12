# frozen_string_literal: true

RSpec.describe Geoextract::Exif::Extractor do
  let(:image_1)   { image_path('image_1.jpg') }
  let(:image_2)   { image_path('image_2.jpg') }
  let(:image_3)   { image_path('subdirectory/image_3.jpg') }
  let(:no_exif)   { image_path('no_exif.jpg') }
  let(:empty_gps) { image_path('empty_gps.jpg') }

  def extract_gps_data(image_path)
    described_class.
      new(image_path).
      extract_gps_data
  end

  def image_path(filename)
    File.expand_path(
      "../../support/images/#{filename}",
      __dir__
    )
  end

  describe 'extracts GPS data' do
    context 'image has GPS data' do
      it 'extract latitude' do
        expect(extract_gps_data(image_1)[:gps_latitude]).
          not_to be_nil
      end
    end

    context 'image empty GPS data' do
      it 'returns an empty Hash' do
        expect(extract_gps_data(empty_gps)).
          to eq({})
      end
    end

    context 'image has no EXIF data' do
      it 'returns an empty Hash' do
        expect(extract_gps_data(no_exif)).
          to eq({})
      end
    end
  end
end
