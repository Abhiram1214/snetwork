class AddImageToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :avatar, :string
  end
end