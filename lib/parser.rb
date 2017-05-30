require 'json'

class Parser

  def read(file_path)
    file = File.read(file_path)
    data = JSON.parse(file)
  end

end
