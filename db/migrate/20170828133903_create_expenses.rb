class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :title
      t.monetize :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
