require_relative "ProductAPI.rb"

module UserModule
  def list_products
    system 'clear'
    puts ProductAPI.get_list
  end

  def search_product
    list_products
    print "\n"
    key = get_string("product by? 'name' | 'id' | 'color' ")
    return if key == -1
    value = get_string("search value for '#{key}' ")
    return if value == -1
    puts ProductAPI.search(key.to_sym, value)
  end

  def get_number(label)
    print "\tEnter #{label}: "
    value = gets.chomp
    if !!(value =~ /[0-9]+/ && value.length == value.match(/[0-9]+/).to_s.length )
      return value.to_i
    elsif value == 'q'
      return -1
    else
      puts "\tInvalid #{label} value. Try again."
      return self.get_number(label)
    end
  end

  def get_string(label)
    print "\tEnter #{label}: "
    value = gets.chomp
    if !(value.strip.empty?)
      return value
    elsif value == 'q'
      return -1
    else
      puts "\tInvalid #{label} value. Try again."
      return self.get_string(label)
    end
  end

end
