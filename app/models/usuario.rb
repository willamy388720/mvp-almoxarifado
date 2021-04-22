class Usuario < ApplicationRecord
  validates :nome, :perfil, :status, presence: true
  enum perfil: %i[Colaborador Gerente Administrador]
  enum status: %i[Ativo Inativo]
end
