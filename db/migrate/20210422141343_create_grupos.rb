class CreateGrupos < ActiveRecord::Migration[6.0]
  def change
    create_table :grupos do |t|
      t.string :nome, limite: 30, null: false
      t.integer :status, default: 0, null: false

      t.timestamps null: false
    end
  end
end
