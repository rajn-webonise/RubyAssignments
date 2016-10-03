class AddBuyerOrderTables < ActiveRecord::Migration
  def change

    ActiveRecord::Schema.define do
      create_table :buyers do |t|
        t.string :name, null: false
        t.timestamps
      end

      create_table :orders do |t|
        t.integer :total_amount, null: false
        t.belongs_to :buyer, index: true
        t.boolean :paid
        t.timestamps
      end
    end

  end
end
