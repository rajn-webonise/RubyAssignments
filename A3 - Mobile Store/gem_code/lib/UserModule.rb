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
    value = get_string("search value for '#{key}' ")
    puts ProductAPI.search(key.to_sym, value)
  end

  def get_number(label)
    print "\tEnter #{label}: "
    value = gets.chomp
    if !!(value =~ /[0-9]/)
      return value.to_i
    else
      puts "\tInvalid #{label} value. Try again."
      return self.get_number(label)
    end
  end

  def get_string(label)
    print "\tEnter #{label}: "
    value = gets.chomp
    unless value.strip.empty?
      return value
    else
      puts "\tInvalid #{label} value. Try again."
      return self.get_string(label)
    end
  end

end
