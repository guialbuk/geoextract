# frozen_string_literal: true

module Geoextract
  class ArgumentParser
    class << self
      def extract_options
        apply_defaults(
          options
        )
      end

      private

      def apply_defaults(parsed)
        default_options.merge(parsed)
      end

      def default_options
        {
          directory: '.',
          format: 'csv'
        }
      end

      def options
        {}.tap(&method(:parse!))
      end

      def parse!(options)
        OptionParser.new do |opts|
          opts.banner = 'Usage: geoextract [options]'

          opts.on(
            '-f',
            '--format [FORMAT]',
            'Output format [csv|html]. Default: csv',
            /csv|html/i
          ) do |format|
            options[:format] = format&.downcase
          end

          opts.on(
            '-d',
            '--directory [DIRECTORY]',
            'Directory to recursively search for images. Default: current directory'
          ) do |directory|
            options[:directory] = directory
          end
        end.parse!
      end
    end
  end
end
