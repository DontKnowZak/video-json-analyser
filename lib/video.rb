class Video

  attr_reader :title, :views, :published_at, :likes_percentage

  def initialize(title, views, link, thumbnail, published_at, likes, dislikes)
    @title = title
    @views = views
    @link = link
    @thumbnail = thumbnail
    @published_at = published_at
    @likes = likes.to_f
    @dislikes = dislikes.to_f
    @total = @likes + @dislikes
    @likes_percentage = calculate_like_dislike_percentage
  end

  def calculate_like_dislike_percentage
    return percent(@likes / @total)
  end

  private

  def percent(decimal)
    (decimal * 100).round(2)
  end

end
