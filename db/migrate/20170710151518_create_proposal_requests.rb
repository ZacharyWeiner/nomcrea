class CreateProposalRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :proposal_requests do |t|
      t.references :proposal, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :accepted
      t.date :accepted_on

      t.timestamps
    end
  end
end
