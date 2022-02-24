# frozen_string_literal: true

# Utility class to display unique views for given page
class TotalUniquesDecorator
  def initialize(page_stats)
    @page_stats = page_stats
  end

  def to_s
    "#{@page_stats.page} #{@page_stats.uniques} unique views"
  end
end
