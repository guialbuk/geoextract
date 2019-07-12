# frozen_string_literal: true

RSpec.describe Geoextract::Exif::Type::Caster do
  def cast(key: :foo, value:)
    described_class.new(key, value).cast
  end

  describe 'cast value' do
    context 'Rational' do
      it 'converts to float' do
        expect(cast(value: Rational(10, 3))).
          to be_a_kind_of(Float)
      end
    end
  end
end
