class Parser
  def initialize(path)
    @path = path
  end

  def call
    raise RuntimeError.new('log file not provided') unless @path
    raise RuntimeError.new("Log file could not be found at #{@path}") unless File.exist?(@path)
    File.read(@path)
  end
end
