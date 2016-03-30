class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :id_usuario
      t.string :token
      t.datetime :fecha_expiracion

      t.timestamps
    end
  end
end
