class CreateWaitlists < ActiveRecord::Migration[5.1]
  def change
    create_table :waitlists do |t|
      t.string :name
      t.string :email
      t.string :instagram
      t.string :px500
      t.string :facebook
      t.string :phone
      t.string :website
      t.string :smugmug

      t.timestamps
    end
  end
end
