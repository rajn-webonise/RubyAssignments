class Test2 < ActiveRecord::Migration
  def self.up

    ActiveRecord::Schema.define do
      create_table :products do |t|
        t.belongs_to :seller, index: true
        t.string :name, null: false
        t.integer :price, null: false
        t.integer :quantity, null: false
      end
    end
  end
  def self.down
  end
end
