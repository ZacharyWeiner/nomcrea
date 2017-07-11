class CreatePortfolioItemAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_item_attachments do |t|
      t.text :attachement
      t.references :portfolio_item, foreign_key: true, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
