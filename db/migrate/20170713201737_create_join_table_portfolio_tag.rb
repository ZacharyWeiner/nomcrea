class CreateJoinTablePortfolioTag < ActiveRecord::Migration[5.1]
  def change
    create_join_table :portfolios, :tags do |t|
      t.index [:portfolio_id, :tag_id]
    end
  end
end
