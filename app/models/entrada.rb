class Entrada < ApplicationRecord
  # Associations
  belongs_to :estoque

  # Validations
  validates :data, :documento, :numero, :quantidade, :preco_unitario, :preco_total, :estoque, presence: true
  validates :quantidade, :preco_unitario, :preco_total, numericality: true

  # Callback
  after_create :after_create_entrada
  after_destroy :after_destroy_entrada

  # Methods Privates
  private

  def after_create_entrada
    preco_total = quantidade * preco_unitario
    update(preco_total: preco_total)
    custo_medio = (((estoque.estoque_saldo * preco_unitario) + (quantidade * preco_unitario)) / (estoque.estoque_saldo + quantidade))
    estoque_saldo = estoque.estoque_saldo + quantidade
    custo_total = estoque_saldo * custo_medio
    estoque.update(custo_medio: custo_medio, estoque_saldo: estoque_saldo, custo_total: custo_total)
  end

  def after_destroy_entrada
    estoque_saldo = estoque.estoque_saldo - quantidade
    custo_total = estoque_saldo * estoque.custo_medio
    estoque.update(estoque_saldo: estoque_saldo, custo_total: custo_total)
  end
end
