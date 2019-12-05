class ChangeColumnNameAgain < ActiveRecord::Migration[6.0]
  def change
    rename_column :purchases, :purchase_type, :ownership
  end
end
