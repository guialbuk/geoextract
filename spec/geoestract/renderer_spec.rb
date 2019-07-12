# frozen_string_literal: true

RSpec.describe Geoextract::Renderer do
  let(:images) { [image_path: 'foo.jpg'] }

  describe 'render view' do
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

    context 'html format' do
      it 'renders HTML view' do
        expect(Geoextract::View::HTML).
          to receive(:new).
          with(images).
          and_call_original

        expect_any_instance_of(Geoextract::View::HTML).
          to receive(:render).
          and_call_original

        described_class.new(images, :html).render
      end
    end
  end
end
