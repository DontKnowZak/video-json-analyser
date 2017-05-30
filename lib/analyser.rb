require 'parser'

class Analyser

  def initialize
    @parser = Parser.new
  end

  def parse_json(file_path = ARGV[0])
    data = @parser.read(file_path)
  end

end
