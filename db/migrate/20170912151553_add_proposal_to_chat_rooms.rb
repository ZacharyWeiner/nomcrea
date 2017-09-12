class AddProposalToChatRooms < ActiveRecord::Migration[5.1]
  def change
    add_reference :chat_rooms, :proposal, foreign_key: true
  end
end
