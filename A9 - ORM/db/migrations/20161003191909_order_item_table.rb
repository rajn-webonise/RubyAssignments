class OrderItemTable < ActiveRecord::Migration
  def change

    ActiveRecord::Schema.define do
      create_table :order_items do |t|
        t.string :item_name, null: false
        t.integer :quantity, null: false
        t.integer :price, null: false
        t.integer :discount
        t.belongs_to :order
        t.timestamps
      end
    end

  end
end
