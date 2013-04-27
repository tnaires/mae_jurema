class AddRespostasToPergunta < ActiveRecord::Migration
  def change
    add_column :perguntas, :resposta, :string
  end
end
