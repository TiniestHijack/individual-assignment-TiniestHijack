class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :exp_date
      t.string :name_on_card
      t.string :organisation
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
