class CreateProposalMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :proposal_messages do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.references :proposal, foreign_key: true

      t.timestamps
    end
  end
end
