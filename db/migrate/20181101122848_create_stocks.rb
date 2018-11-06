# frozen_string_literal: true

class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.numeric :unit_price
      t.numeric :interest
      t.numeric :duration_in_years

      t.timestamps
    end
  end
end
