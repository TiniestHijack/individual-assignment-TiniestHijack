class AddCustomerToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :customer, null: false, foreign_key: true
  end
end
