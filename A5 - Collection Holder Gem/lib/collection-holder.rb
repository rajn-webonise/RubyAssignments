require_relative 'que.rb'
require_relative 'error.rb'
require_relative 'config.rb'

class CollectionHolder

  attr_reader :holder

  @@collectionID = 0

  def initialize(data = {})
    raise Error if !valid_number(data[:size]) && data[:size]

    @size = data[:size].to_i || $DEFAULT_HOLDER_SIZE
    @holder = Hash.new
  rescue => e
      e.init_failed(self.class)
  end

  def add(collection)
  raise Error if @holder.size >= @size

  @holder[key(@@collectionID)] = collection
  @@collectionID += 1
  rescue => e
    e.max_size_reached(self.class)
  end

  def find(id)
    @holder[key(id)]
  end

  def display
    @holder.each do |key, collection|
      puts "CollectionID##{key.to_s} | #{collection.class.to_s} | #{collection.display}\n"
    end
  end

  def delete(id)
    raise Error if @holder.empty?

    @holder.delete(key(id))
    rescue => e
      e.min_size_reached(self.class)
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
