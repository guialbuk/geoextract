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

    it 'handles image with empty GPS data' do
      expect(extract_gps_data(empty_gps)[:gps_latitude]).
        to be_nil
    end

    it 'handles image without EXIF data' do
      expect(extract_gps_data(no_exif)[:gps_latitude]).
        to be_nil
    end

    it 'injects image path' do
      expect(extract_gps_data(no_exif)[:image_path]).
        to eq(no_exif)
    end
  end
end
