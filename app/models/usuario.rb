class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  validates :nome, :perfil, :status, presence: true
  enum perfil: %i[Colaborador Gerente Administrador]
  enum status: %i[Ativo Inativo]
end
