# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :votes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
