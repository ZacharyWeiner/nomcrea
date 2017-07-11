class AddCompletedAndCompletedOnToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :completed, :boolean
    add_column :proposals, :completed_on, :date
  end
end
