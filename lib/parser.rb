require 'json'
require_relative 'video'

class Parser

  def read(file_path)
    file = File.read(file_path)
    data = JSON.parse(file)
    videos = []
    data["videos"].each do |video|
      videos << Video.new(video["title"], video["views"], video["link"], video["thumbnail"], video["published_at"], video["likes"], video["dislikes"])
    end
    return videos
  end

end
