class AddSituationToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :situation, null: false, foreign_key: true
  end
end
