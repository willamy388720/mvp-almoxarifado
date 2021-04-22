class CreateEstoques < ActiveRecord::Migration[6.0]
  def change
    create_table :estoques do |t|
      t.integer :tipo, default: 0, null: false
      t.string :descricao, limite: 50, null: false
      t.string :codigo, limite: 30, null: true
      t.string :unidade, limite: 5, null: false
      t.boolean :perecivel, default: false
      t.decimal :estoque_minimo, default: 0, null: false, precision: 11, scale: 4
      t.decimal :estoque_maximo, default: 0, null: false, precision: 11, scale: 4
      t.decimal :estoque_reposicao, default: 0, null: false, precision: 11, scale: 4
      t.decimal :estoque_saldo, default: 0, null: false, precision: 11, scale: 4
      t.decimal :custo_medio, default: 0, null: false, precision: 11, scale: 2
      t.decimal :custo_total, default: 0, null: false, precision: 11, scale: 2
      t.string :conta_contabil, limite: 30, null: true
      t.string :localizacao, limite: 30, null: true
      t.integer :status, default: 0, null: false
      t.references :grupo, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
