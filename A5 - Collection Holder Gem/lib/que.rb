require_relative 'error.rb'
require_relative 'config.rb'

class Que

  attr_reader :max_size

  def initialize(data = {})
    raise Error.init_failed(self.class) if !valid_number(data[:size]) && data[:size]
    @max_size = get_number(data[:size]) || $DEFAULT_QUE_SIZE
    @list = Queue.new
    push_list(data[:list]) if data[:list]
  end

  def pop!
    raise Error.min_size_reached(self.class) if @list.empty?
    @list.pop
  end

  def push(item)
    raise Error.max_size_reached(self.class) if @list.size >= @max_size
    @list.push item
  end

  def clear!
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
    raise Error.max_size_reached(self.class) if (@list.size + list.size) >= @max_size
    list.each { |data| @list.push data } if list.is_a? Array
  end

  def display
    @list.to_s
  end

  private
    def valid_number(str)
      str = str.to_s
      !!(str =~ /[0-9]+/ && str.length == str.match(/[0-9]+/).to_s.length)
    end

    def get_number(str)
      return nil if str.nil?
      return str.to_i
    end

end
