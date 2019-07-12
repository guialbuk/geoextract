# frozen_string_literal: true

module Geoextract
  module View
    class CSV < Base
      def render
        ::CSV.generate do |csv|
          csv << columns

          rows.each { |row| csv << row }
        end
      end
    end
  end
end
