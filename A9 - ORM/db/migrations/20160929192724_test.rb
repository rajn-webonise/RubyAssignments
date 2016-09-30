
#db_config = YAML::load(File.open('../../config/database.yml'))
#db_config["database"] = "../../"+db_config["database"]
#ActiveRecord::Base.establish_connection(db_config)

class Test < ActiveRecord::Migration
  def self.up
    ActiveRecord::Schema.define do
      create_table :sellers do |t|
        t.string :name, null: false
        t.integer :address, null: true
      end
    end
  end
  def self.down
  end
end
