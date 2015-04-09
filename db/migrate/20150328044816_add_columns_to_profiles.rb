class AddColumnsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :name, :string
    add_column :profiles, :age, :string
    add_column :profiles, :aboutwork, :string
  end
end
