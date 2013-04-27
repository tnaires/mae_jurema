class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :foto
      t.text :caracteristicas

      t.timestamps
    end
  end
end
