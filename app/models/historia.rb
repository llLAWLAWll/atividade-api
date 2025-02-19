class Historia < ApplicationRecord

  belongs_to :status
  has_many :tarefas

  def self.ransackable_attributes(auth_object = nil)
    ["titulo", "descricao", "finalizada"]
  end
end
