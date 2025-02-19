class Tarefa < ApplicationRecord
  belongs_to :status
  belongs_to :historia

  def self.ransackable_attributes(auth_object = nil)
    ["id", "titulo", "descricao", "created_at", "updated_at"]
  end
end
