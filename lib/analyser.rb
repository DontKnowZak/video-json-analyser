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
    total_views = total_views(video_data)
    @printer.output(@highest_percentage, average_percentage, total_views)
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

  def total_views(videos)
    view_count = 0
    videos.each do |video|
      view_count += get_views(video)
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

  def add_percentage_to_total(percentage)
    @total_percentages += percentage
  end

  def get_views(video_data)
    video_data["views"]
  end

end
