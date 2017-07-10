class RenameTypeToProposalType < ActiveRecord::Migration[5.1]
  def change
    rename_column :proposals, :type, :proposal_type
  end
end
