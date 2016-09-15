require_relative 'FileStorageModule.rb'


class ProductAPI

  extend FileStorageModule

  @@file_path = Dir.pwd + "/FileStorage/products.log"

  def self.seed
    @@list = read_file(@@file_path)
  end

  def self.get_list
    @@list ||= Array.new
  end

  def self.add(product)
    @@list ||= Array.new
    product[:id] = @@list.size
    @@list.push(product)
    add_line(@@file_path, product)
  end

  def self.search(key, value)
    @@list.each do |product|
      return product if product[key] == value
    end
    return nil
  end

  def self.search_id(id)
    search(:id, id)
  end

  def self.update(id, key, value)
    if(key==:id)
      puts "Can't update id!"
      return
    end
    old_product = @@list[id]
    @@list[id][key] = value
    update_line(@@file_path, old_product, @@list[id])
  end

  def self.delete(id)
    remove_line(@@file_path, search_id(id))
    @@list - [search_id(id)]
  end

end
