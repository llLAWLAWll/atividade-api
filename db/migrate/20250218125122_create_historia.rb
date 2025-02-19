class CreateHistoria < ActiveRecord::Migration[8.0]
  def change
    create_table :historia do |t|
      t.string :titulo
      t.text :descricao
      t.boolean :finalizada
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
