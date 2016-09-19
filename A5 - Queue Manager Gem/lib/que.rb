require 'byebug'

$DEFAULT_QUE_SIZE = 10

class Que

  @@QueueID = 0

  attr_reader :id, :type, :max_size

  def initialize(data={})
    @type = "Que"
    @id = @@QueueID
    @list = Queue.new
    @@QueueID += 1
    @max_size = $DEFAULT_QUE_SIZE
    @max_size = data[:size] if data[:size]
    push_list(data[:list]) if data[:list]
  end

  def pop
    if @list.size<1
      puts "Empty collection! Can't pop()"
    elsif
      @list.pop
    end
  end

  def push(x)
    begin
      if @list.size>=max_size
        puts "Full collection! Can't push(#{x.to_s})"
      elsif
        @list.push(x)
      end
    rescue
      puts "Unable to push #{x.to_s}"
    end
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
   length==0
  end

  def push_list(list)
    begin
      list.each { |data| @list.push data } if list.is_a? Array
    rescue
      puts "Unable to push list #{list.to_s}"
    end
  end

  def display
    @list.to_s
  end

end
