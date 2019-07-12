# frozen_string_literal: true

RSpec.describe Geoextract::Exif::Type::Caster do
  def cast(key, value)
    described_class.new(key, value).cast
  end

  describe 'cast values' do
    context 'gps_version_id key' do
      it 'converts to String' do
        expect(cast(:gps_version_id, [2, 2, 0, 0])).
          to eq('2.2.0.0')
      end
    end

    context 'gps_latitude key' do
      it 'converts to Float' do
        coordinates = [Rational(90, 2), Rational(15, 1), Rational(0, 1)]

        expect(cast(:gps_latitude, coordinates)).
          to eq(45.25)
      end
    end

    context 'gps_longitude key' do
      it 'converts to Float' do
        coordinates = [Rational(30, 1), Rational(30, 1), Rational(0, 1)]

        expect(cast(:gps_longitude, coordinates)).
          to eq(30.5)
      end
    end

    context 'gps_time_stamp key' do
      it 'converts to Time' do
        time = [Rational(0, 1), Rational(0, 1), Rational(0, 1)]

        expect(cast(:gps_time_stamp, time).to_s).
          to eq('1970-01-01T00:00:00Z')
      end
    end
  end
end
