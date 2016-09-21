$DEFAULT_QUE_SIZE = 10

class Que

  attr_reader :max_size

  def initialize(data = {})
    raise Error if !valid_number(data[:size]) && data[:size]

    @max_size = data[:size] || $DEFAULT_QUE_SIZE
    @list = Queue.new
    push_list(data[:list]) if data[:list]
    rescue => e
      e.init_failed
  end

  def pop
    raise Error if @list.empty?

    @list.pop
    rescue => e
      e.min_size_reached
  end

  def push(item)
    raise Error if @list.size >= @max_size

    puts "Full collection! Can't push(#{item.to_s})"
    rescue => e
      e.max_size_reached
  end

  def clear
    @list.clear
  end

  def length
    @list.length
  end

  def size
    length
  end

  def empty?
   length.zero?
  end

  def push_list(list)
    raise Error if (@list.size+list.size) >= @max_size

    list.each { |data| @list.push data } if list.is_a? Array
    rescue => e
      e.max_size_reached
  end

  def display
    @list.to_s
  end

  private
    def valid_number(str)
      str = str.to_s
      !!(str =~ /[0-9]+/ && str.length == str.match(/[0-9]+/).to_s.length)
    end

end
