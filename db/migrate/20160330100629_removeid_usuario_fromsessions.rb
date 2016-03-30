class RemoveidUsuarioFromsessions < ActiveRecord::Migration
  def change
  	remove_column :sessions, :id_usuario, :integer
  end
end
