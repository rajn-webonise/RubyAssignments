require 'json'

module FileStorageModule

  def read_file(fp)
    list = []
    File.open(fp, 'r') do |f|
      f.each do |line|
        content = JSON.parse(line, symbolize_names: true)
        list.push( content ) unless content[:del]
      end
    end
    return list
  end

  def add_line(fp, data)
    new_line = data.to_json
    File.open(fp, 'a') do |file|
      file.puts new_line
    end
  end

  def update_line(fp, old_data, new_data)
    old_line = old_data.to_json
    new_line = new_data.to_json
    content = File.read(fp)
    content.sub!(old_line, new_line)
    File.open(fp, "w") {|file| file.puts content }
  end

  def remove_line(fp, data)
    update_line(fp, data, {del: true})
  end

end
