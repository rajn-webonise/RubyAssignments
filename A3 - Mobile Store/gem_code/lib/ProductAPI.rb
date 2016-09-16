require_relative 'FileStorageModule'
require 'byebug'
class ProductAPI

  extend FileStorageModule

  @@file_path = File.join(File.dirname(caller[0]), "/FileStorage/products.log")

  def self.seed
    byebug
    @@list = read_file(@@file_path)
  end

  def self.get_list
    @@list ||= Array.new
  end

  def self.add(product)
    @@list ||= Array.new
    product[:id] = max_id_value + 1
    puts "ProductAPI#add: Creating a product with these details: #{product}"
    @@list.push(product)
    add_line(@@file_path, product)
  end

  def self.search(key, value)
    if(key==:id || key==:quantity || key==:price)
      value = value.to_i
    end
    @@list.each do |product|
      return product if product[key] == value
    end
    return nil
  end

  def self.search_id(id)
    search(:id, id)
  end

  def self.update(id, key, value)
    unless(key==:name || key==:color || key==:price || key==:quantity)
      puts "Invalid command. Cannot update #{key} field."
      return
    end
    if(key==:quantity || key==:price)
      value = value.to_i
    end
    old_product = search_id(id).clone
    @@list = @@list.map do |product|
      if product[:id] == id
        product[key] = value
        puts "ProductAPI#update: Updating product id#{id} with these details: #{key}: #{value}"
        update_line(@@file_path, old_product, product)
      end
        product
    end
  end

  def self.delete(id)
    puts "ProductAPI#delete: Deleting product id#{id}"
    @@list -= [search_id(id)]
    remove_line(@@file_path, search_id(id))
  end

  private
    def self.max_id_value
      @@list.inject(0){|max, p| max = max > p[:id]? max:p[:id] }
    end

end
