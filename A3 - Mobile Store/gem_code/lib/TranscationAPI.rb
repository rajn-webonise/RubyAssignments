require_relative 'FileStorageModule.rb'

class TranscationAPI

  extend FileStorageModule

  @@file_path = Dir.pwd + "/lib/FileStorage/transcations.log"

  def self.seed
    @@list = read_file(@@file_path)
  end

  def self.record(transcation)
    @@list ||= Array.new
    transcation[:id] = @@list.size
    @@list.push(transcation)
    puts "TranscationAPI#record: Recording a transcation with these details: #{transcation}"
    add_line(@@file_path, transcation)
  end

  def self.get_list
    @@list
  end

end
