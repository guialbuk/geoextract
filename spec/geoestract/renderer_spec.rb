# frozen_string_literal: true

RSpec.describe Geoextract::Renderer do
  let(:images) { [] }

  describe '#render' do
    context 'csv format' do
      it 'renders CSV view' do
        expect(Geoextract::View::CSV).
          to receive(:new).
          with(images).
          and_call_original

        expect_any_instance_of(Geoextract::View::CSV).
          to receive(:render).
          and_call_original

        described_class.new(images, :csv).render
      end
    end
  end
end
