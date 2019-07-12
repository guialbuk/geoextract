# frozen_string_literal: true

RSpec.describe Geoextract::Exif::Type::Caster do
  def cast(key, value)
    described_class.new(key, value).cast
  end

  describe 'cast values' do
    context 'gps_version_id key' do
      it 'casts to string' do
        expect(cast(:gps_version_id, [2, 2, 0, 0])).
          to eq('2.2.0.0')
      end
    end
  end
end
