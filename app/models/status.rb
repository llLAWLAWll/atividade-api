class Status < ApplicationRecord

  has_many :historias
  has_many :tarefas

  validates :descricao, inclusion: { in: ['Pendente', 'Em andamento', 'Concluído'], message: "'%{value}' Não é um status válido" }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "descricao", "created_at", "updated_at"]
  end
end
