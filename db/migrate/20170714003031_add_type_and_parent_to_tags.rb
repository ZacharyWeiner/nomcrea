class AddTypeAndParentToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :tag_type, :string
    add_column :tags, :parent_id, :integer
  end
end
