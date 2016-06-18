require 'csv'

module Parser
  class WhiskyanalysisCom
    using UtfBom

    attr_reader :results, :counts

    def initialize(source)
      @source = source
      @results = []
      @counts = { created: 0, updated: 0 }
    end

    def run
      CSV.new(data, headers: :first_line).each do |row|
        instance = process_row(row)

        count(instance)

        instance.save!
      end
    end

    private

    def data
      @data ||= open(@source).read.clear_bom!
    end

    def count(instance)
      if instance.new_record?
        @counts[:created] += 1
      else
        @counts[:updated] += 1
      end

      @results << instance
    end

    def process_row(row)
      instance = Identity.find_or_initialize_by(
        name: row['Whisky'],
        provider: 'whiskyanalysis.com'
      )

      instance.rating = row['Meta Critic'].to_f
      instance.cost = row['Cost'].length

      parse_classification(row, instance)
      parse_location(row, instance)
      parse_info(row, instance)

      instance
    end

    def parse_classification(row, instance)
      instance.classification = {
        class: row['Class'],
        super_cluster: row['Super Cluster'],
        cluster: row['Cluster'],
        type: row['Type']
      }
    end

    def parse_location(row, instance)
      instance.location = {
        country: row['Country']
      }
    end

    def parse_info(row, instance)
      instance.info = {
        rating_stdev: row['STDEV'].to_i,
        ratings_count: row['#'].to_i
      }
    end
  end
end
