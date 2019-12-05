class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :purchases, :type, :purchase_type
  end
end
