class AddHistoriaToTarefas < ActiveRecord::Migration[8.0]
  def change
    add_reference :tarefas, :historia, null: false, foreign_key: true
  end
end
