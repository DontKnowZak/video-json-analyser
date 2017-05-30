require 'json'

class Analyser

  def parse_json(file_path = ARGV[0])
    file = File.read(file_path)
    data = JSON.parse(file)
  end

end
