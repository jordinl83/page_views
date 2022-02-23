# frozen_string_literal: true

# frozen_string_literal:

require 'lib/page_visit'

# Log file parser
class Parser
  def initialize(path)
    @path = path
  end

  def call
    raise 'log file not provided' unless @path
    raise "Log file could not be found at #{@path}" unless File.exist?(@path)

    page_views = []

    File.foreach(@path) do |line|
      page_views << PageVisit.new(*line.split)
    end

    page_views
  end
end
