class CreateIbans < ActiveRecord::Migration[7.0]
  def change
    create_table :ibans do |t|
      t.string :number
      t.string :name

      t.timestamps
    end
    add_index :ibans, :number, unique: true
    add_index :ibans, :name, unique: true
  end
end

