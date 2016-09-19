require_relative "que.rb"
require 'byebug'

class CollectionManager

  attr_reader :list

  def initialize
    @list = []
  end

  def add(collection)
    @list.push collection
  end

  def get(id)
    output = @list.select do |q|
      q.id == id
    end
    output[0]
  end

  def display_all
    @list.each do |q|
      puts "CollectionID##{q.id} | #{q.type} | #{q.display}\n"
    end
  end

  def delete(id)
    @list.reject! do |q|
      q.id == id
    end
  end

end
