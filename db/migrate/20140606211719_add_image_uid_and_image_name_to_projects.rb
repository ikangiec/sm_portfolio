class AddImageUidAndImageNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :image_uid, :string
    add_column :projects, :image_name, :string
  end
end
