# frozen_string_literal: true

RSpec.describe Geoextract::Exif::Type::Caster do
  def cast(key, value)
    described_class.new(key, value).cast
  end

  describe 'cast values' do
    context 'gps_version_id key' do
      it 'converts to string' do
        expect(cast(:gps_version_id, [2, 2, 0, 0])).
          to eq('2.2.0.0')
      end
    end

    context 'gps_latitude key' do
      it 'converts to float' do
        coordinates = [Rational(90, 2), Rational(15, 1), Rational(0, 1)]

        expect(cast(:gps_latitude, coordinates)).
          to eq(45.25)
      end
    end

    context 'gps_longitude key' do
      it 'converts to float' do
        coordinates = [Rational(30, 1), Rational(30, 1), Rational(0, 1)]

        expect(cast(:gps_latitude, coordinates)).
          to eq(30.5)
      end
    end
  end
end
