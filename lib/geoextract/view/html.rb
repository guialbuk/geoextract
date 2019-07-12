# frozen_string_literal: true

module Geoextract
  module View
    class HTML < Base
      def render
        ::ERB.
          new(template).
          result(binding)
      end

      private

      def template
        <<~ERB
          <!DOCTYPE html>
          <html>
            <head>
              <title>geoextract</title>
                <link rel="stylesheet" href="https://cdn.rawgit.com/milligram/milligram/master/dist/milligram.min.css">
            </head>
            <body>
              <table>
                <thead>
                  <tr>
                    <% columns.each do |column| %>
                      <th><%= column %></th>
                    <% end %>
                  </tr>
                </thead>
                <tbody>
                  <% rows.each do |row| %>
                    <tr>
                      <% row.each do |column| %>
                        <td><%= column %></td>
                      <% end %>
                    </tr>
                   <% end %>
                </tbody>
              </table>
            </body>
          </html>
        ERB
      end
    end
  end
end
