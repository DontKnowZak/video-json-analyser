require_relative 'parser'
require_relative 'printer'

class Analyser

  def initialize
    @parser = Parser.new
    @printer = Printer.new
  end

  def parse_json(file_path = ARGV[0])
    if file_path == nil then
      raise 'No file path provided.'
    end
    @data = @parser.read(file_path)
  end

  def run
    parse_json
    video_data = @data["videos"]
    highest_like_dislike_percentage(video_data)
    average_percentage = average_like_dislike_percentage(video_data)
    @printer.output(@highest_percentage, average_percentage)
  end

  def calculate_like_dislike_percentage(video_data)
    likes = video_data["likes"].to_f
    total = (video_data["likes"] + video_data["dislikes"]).to_f
    return percent(likes / total)
  end

  def highest_like_dislike_percentage(video_data)
    @highest_percentage = [0, ""]
    video_data.each do |video|
      percentage = calculate_like_dislike_percentage(video)
      title = video["title"]
      check_highest(percentage) ? update_highest([percentage, title]) : @highest_percentage
    end
    return @highest_percentage
  end

  def average_like_dislike_percentage(videos)
    @total_percentages = 0
    videos.each do |video|
      percentage = calculate_like_dislike_percentage(video)
      add_percentage_to_total(percentage)
    end
    return (@total_percentages / videos.size).round(2)
  end

  private

  def percent(decimal)
    (decimal * 100).round(2)
  end

  def check_highest(percentage)
    @highest_percentage[0] < percentage
  end

  def update_highest(highest)
    @highest_percentage = highest
  end

  def add_percentage_to_total(percentage)
    @total_percentages += percentage
  end

end
