class CreatePortfolioItems < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_items do |t|
      t.string :title
      t.text :cover_image
      t.text :description
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
