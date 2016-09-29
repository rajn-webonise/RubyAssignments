require 'byebug'
require 'active_record'
require 'yaml'

db_config = YAML::load(File.open('../config/database.yml'))

ActiveRecord::Base.establish_connection(db_config)

class Seller < ActiveRecord::Base
  has_many :products
end

byebug

puts 4
