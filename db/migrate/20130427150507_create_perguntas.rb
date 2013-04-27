class CreatePerguntas < ActiveRecord::Migration
  def change
    create_table :perguntas do |t|
      t.string :pergunta
      t.string :caracteristica

      t.timestamps
    end
  end
end
