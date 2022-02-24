# frozen_string_literal: true

require 'lib/total_uniques_decorator'
require 'lib/total_visits_decorator'

# Generate total visits and unique views report for given collection of page visits
class Report
  def initialize(aggregates)
    @aggregates = aggregates
  end

  def call
    [
      @aggregates.sort_by { |stats| -stats.visits }.map { |stats| TotalVisitsDecorator.new(stats) },
      @aggregates.sort_by { |stats| -stats.uniques }.map { |stats| TotalUniquesDecorator.new(stats) }
    ]
  end
end
