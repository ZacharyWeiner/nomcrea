class AddTypeToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :type, :string
  end
end
