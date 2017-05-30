class Printer

  def output(highest_percentage, average_percentage, total_views)
    print "The video with the highest percentage of likes vs. dislikes was \"#{highest_percentage[1]}\".\n"
    print "The average percentage of likes vs. dislikes was #{average_percentage}%.\n"
    print "And the total number of views across all the videos was #{total_views}.\n"
  end

end
