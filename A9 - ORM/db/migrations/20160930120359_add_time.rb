class AddTime < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.timestamps
    end

    change_table :sellers do |t|
      t.timestamps
    end

    change_table(:products) do |t|
      t.references :sellers
    end
  end
  def self.down
  end
end
