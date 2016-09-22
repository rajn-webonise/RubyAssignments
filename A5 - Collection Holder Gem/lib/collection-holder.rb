require_relative 'que.rb'
require_relative 'error.rb'
require_relative 'config.rb'

class CollectionHolder

  attr_reader :holder

  @@collectionID = 0

  def initialize(data = {})
    raise Error.init_failed(self.class) if !valid_number(data[:size]) && data[:size]
    @size = data[:size].to_i || $DEFAULT_HOLDER_SIZE
    @holder = Hash.new
  end

  def add(collection_type, data = {})
  raise Error.max_size_reached(self.class) if @holder.size >= @size
  @holder[key(@@collectionID)] = Object::const_get(collection_type).new(data)
  @@collectionID += 1
  end

  def find(id)
    @holder[key(id)]
  end

  def display
    @holder.each do |key, collection|
      puts "CollectionID##{key.to_s} | #{collection.class.to_s} | #{collection.display}\n"
    end
  end

  def delete!(id)
    raise Error.min_size_reached(self.class) if @holder.empty?
    @holder.delete(key(id))
  end

  private
    def key(id)
      id.to_s.to_sym
    end

    def valid_number(str)
      str = str.to_s
      !!(str =~ /[0-9]+/ && str.length == str.match(/[0-9]+/).to_s.length)
    end

end

begin
  ch = CollectionHolder.new(size: '32')
  ch.add("Que")
  ch.add("Que")
  ch.delete!(0)
  ch.display
#rescue #?

end
