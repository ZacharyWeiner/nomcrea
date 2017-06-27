class CreatePortfolioItemAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_item_attachments do |t|
      t.text :attachement
      t.references :portfolio_item, foreign_key: true

      t.timestamps
    end
  end
end
