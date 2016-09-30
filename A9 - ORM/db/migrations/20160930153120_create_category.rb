class CreateCategory < ActiveRecord::Migration
  def change

    add_foreign_key :products, :sellers

    ActiveRecord::Schema.define do
      create_table :categories do |t|
        t.string :name, null: false
        t.timestamps
      end

      add_reference :products, :category, index: true
    end

  end

end
