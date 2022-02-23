# frozen_string_literal: true

# Log file parser
class Parser
  def initialize(path)
    @path = path
  end

  def call
    raise 'log file not provided' unless @path
    raise "Log file could not be found at #{@path}" unless File.exist?(@path)

    File.read(@path)
  end
end
