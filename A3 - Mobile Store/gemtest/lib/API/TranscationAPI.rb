#require  Dir.pwd + '/FileStorageModule.rb'
require_relative 'FileStorageModule.rb'
#Dir[ Dir.pwd + "/*.rb"].each {|file| require file }


class TranscationAPI

  extend FileStorageModule

  @@file_path = Dir.pwd + "/FileStorage/transcations.log"

  def self.seed
    @@list = read_file(@@file_path)
  end

  def self.record(transcation)
    @@list ||= Array.new
    transcation[:id] = @@list.size
    @@list.push(transcation)
    add_line(@@file_path, transcation)
  end

  def self.get_list
    @@list
  end

end
