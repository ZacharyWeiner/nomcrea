class AddAcceptedToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :accepted, :integer
  end
end
