# frozen_string_literal: true

require 'set'
require 'lib/page_stats'

# Aggregates visit stats for a given collection of visits
class VisitsAggregator
  def initialize(visits)
    @visits = visits
  end

  def call
    aggregates = @visits.each_with_object({}) do |visit, agg|
      agg[visit.page] ||= PageStats.new(visit.page)
      agg[visit.page].add_visit(visit.ip)
    end

    aggregates.values
  end
end
