# frozen_string_literal: true

class AddRememberTokenToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember_digest, :string
  end
end
