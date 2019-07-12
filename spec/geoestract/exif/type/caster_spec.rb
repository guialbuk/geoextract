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
        time = [Rational(13, 1), Rational(31, 1), Rational(4400, 1)]

        expect(cast(:gps_time_stamp, time)).
          to eq('14:44:20')
      end
    end

    context 'gps_altitude key' do
      it 'converts to Float' do
        altitude = Rational(15, 2)

        expect(cast(:gps_altitude, altitude)).
          to eq(7.5)
      end
    end

    context 'nil values' do
      it 'does not convert' do
        expect(cast(:gps_time_stamp, nil)).
          to be_nil
      end
    end
  end
end
