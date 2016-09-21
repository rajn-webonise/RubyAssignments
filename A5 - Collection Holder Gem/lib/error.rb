class Error < StandardError

  def init_failed
    puts "Couldn't make object"
  end

  def max_size_reached
    puts "Maximum size reached"
  end

  def min_size_reached
    puts "Minimum size reached"
  end

end
