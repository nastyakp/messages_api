class AddDefaultValueToMessagesVotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :votes
    add_column :messages, :votes, :integer, default: 0
  end
end
