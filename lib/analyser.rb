require 'parser'

class Analyser

  def initialize
    @parser = Parser.new
  end

  def parse_json(file_path = ARGV[0])
    data = @parser.read(file_path)
  end

  def calculate_like_dislike_percentage(video_data)
    likes = video_data["likes"].to_f
    total = (video_data["likes"] + video_data["dislikes"]).to_f
    return ((likes / total)* 100).round(2)
  end
  
end
