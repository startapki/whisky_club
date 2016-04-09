require 'rake'

namespace :items do
  namespace :identities do
    task :load, [:provider, :source] => [:environment] do |_t, args|
      Rails.logger = Logger.new(STDOUT)

      parser_klass_name = "Parser::#{args[:provider].tr('.', '_').classify}"
      parser_klass = parser_klass_name.constantize

      parser = parser_klass.new(args[:source])
      parser.run

      Rails.logger.info("Created: #{parser.counts[:created]}")
      Rails.logger.info("Updated: #{parser.counts[:updated]}")
    end
  end
end
