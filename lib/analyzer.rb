# frozen_string_literal: true

require 'lib/parser'
require 'lib/visits_aggregator'
require 'lib/report'

# Analyze log file for page views
class Analyzer
  def initialize(path)
    @path = path
  end

  def call
    visits = Parser.new(@path).call
    aggregates = VisitsAggregator.new(visits).call
    Report.new(aggregates).call
  end
end
