# frozen_string_literal: true

require 'lib/parser'

# Analyze log file for page views
class Analyzer
  def initialize(path)
    @path = path
  end

  def call
    Parser.new(@path).call
  end
end
