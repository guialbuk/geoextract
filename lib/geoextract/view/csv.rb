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
    end
  end
end
