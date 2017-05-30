class Printer

  def output(highest_percentage, average_percentage, total_views, average_time)
    print "The video with the highest percentage of likes vs. dislikes was \"#{highest_percentage[1]}\".\n"
    print "The average percentage of likes vs. dislikes was #{average_percentage}%.\n"
    print "And the total number of views across all the videos was #{total_views}.\n"
    print "And the average time between videos was #{average_time[0]} days, #{average_time[1]} hours, #{average_time[2]} minutes and #{average_time[3]} seconds\n"
  end

end
