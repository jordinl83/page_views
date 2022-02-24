# frozen_string_literal: true

# Calculates visits and unique visitors for given page
class PageStats
  attr_reader :visits, :page

  def initialize(page)
    @page = page
    @visitors = Set.new
    @visits = 0
  end

  def add_visit(ip)
    @visitors.add(ip)
    @visits += 1
  end

  def uniques
    @visitors.length
  end
end
