# frozen_string_literal: true

# Utility class to display total visits for given page
class TotalVisitsDecorator
  def initialize(page_stats)
    @page_stats = page_stats
  end

  def to_s
    "#{@page_stats.page} #{@page_stats.visits} visits"
  end
end
