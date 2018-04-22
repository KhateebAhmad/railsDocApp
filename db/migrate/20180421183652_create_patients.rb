class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.column :name, :string, :null => false
      t.column :dateofbirth, :date
      t.column :address, :text
      t.column :phonenumber, :integer
      t.column :injury, :text
      t.column :requestscan, :string, :default => "no"
      t.column :typeofscan, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
