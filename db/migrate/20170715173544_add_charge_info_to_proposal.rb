class AddChargeInfoToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :is_paid, :boolean
    add_column :proposals, :charge_id, :string
  end
end
