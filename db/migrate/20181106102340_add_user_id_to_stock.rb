# frozen_string_literal: true

class AddUserIdToStock < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :user_id, :integer
  end
end
