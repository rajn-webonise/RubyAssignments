class Error < StandardError

  def init_failed(klass)
    puts "Couldn't make object in class:#{klass}"
  end

  def max_size_reached(klass)
    puts "Maximum size reached in class:#{klass}"
  end

  def min_size_reached(klass)
    puts "Minimum size reached in class:#{klass}"
  end

end
