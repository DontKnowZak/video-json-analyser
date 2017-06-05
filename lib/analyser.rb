require_relative 'parser'
require_relative 'printer'
require 'date'

class Analyser

  def initialize
    @parser = Parser.new
    @printer = Printer.new
  end

  def parse_json(file_path = ARGV[0])
    if file_path == nil then
      raise 'No file path provided.'
    end
    @videos = @parser.read(file_path)
  end

  def run
    parse_json
    highest_percentage = highest_like_dislike_percentage
    average_percentage = average_like_dislike_percentage
    total_views = total_views(video_data)
    average_time_between_videos = average_time_between_videos(video_data)
    @printer.output(highest_percentage, average_percentage, total_views, average_time_between_videos)
  end

  def highest_like_dislike_percentage
    @highest_percentage = [0, ""]
    @videos.each do |video|
      title = video.title
      check_highest(video.likes_percentage) ? update_highest([video.likes_percentage, video.title]) : @highest_percentage
    end
    return @highest_percentage
  end

  def average_like_dislike_percentage
    total_percentages = 0
    @videos.each do |video|
      total_percentages += video.likes_percentage
    end
    return (total_percentages / @videos.size).round(2)
  end

  def total_views(videos)
    view_count = 0
    videos.each do |video|
      view_count += video.views
    end
    return view_count
  end

  def average_time_between_videos(videos)
    total_time = total_time_between_videos(videos)
    average_time = (total_time / (videos.size - 1)).round
    minutes, seconds = average_time.divmod(60)
    hours, minutes = minutes.divmod(60)
    days, hours = hours.divmod(24)
    return [days, hours, minutes, seconds]
  end

  def total_time_between_videos(videos)
    total_time = 0
    previous_time = nil
    videos.each do |video|
      this_time = DateTime.iso8601(video["published_at"]).to_time
      if previous_time then
        total_time += (previous_time - this_time)
      end
      previous_time = this_time
    end
    return total_time
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

end
