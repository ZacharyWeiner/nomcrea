class CreateJoinTableProposalTag < ActiveRecord::Migration[5.1]
  def change
    create_join_table :proposals, :tags do |t|
      t.index [:proposal_id, :tag_id]
    end
  end
end
