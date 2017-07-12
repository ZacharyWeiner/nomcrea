class CreateRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :requirements do |t|
      t.string :title
      t.text :description
      t.integer :accepted, default: 0
      t.references :proposal, foreign_key: true
      t.timestamps
    end
  end
end
