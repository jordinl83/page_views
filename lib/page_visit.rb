# frozen_string_literal: true

# Visit to a page by a given IP address
class PageVisit
  attr_reader :page, :ip

  def initialize(page, ip)
    @page = page
    @ip = ip
  end

  def ==(other)
    page == other.page && ip == other.ip
  end

  def to_s
    "#{page} #{ip}"
  end
end
