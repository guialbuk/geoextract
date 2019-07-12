# frozen_string_literal: true

module Geoextract
  module View
    class CSV < Base
      def render
        ::CSV.generate do |csv|
          csv << columns

          images.each do |image|
            csv << columns.map { |key| image[key] }
          end
        end
      end

      private

      def columns
        @columns ||=
          images.
            map(&:keys).
            flatten.
            uniq
      end
    end
  end
end
