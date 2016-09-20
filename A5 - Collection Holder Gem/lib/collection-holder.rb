require_relative 'que.rb'

class CollectionHolder

  attr_reader :holder

  @@collectionID = 0

  def initialize
    @holder = Hash.new
  end

  def add(collection)
    @holder[key(@@collectionID)] = collection
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

  def delete(id)
    @holder.delete(key(id))
  end

  private
    def key(id)
      id.to_s.to_sym
    end

end
