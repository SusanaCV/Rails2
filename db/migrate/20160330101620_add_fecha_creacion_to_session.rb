class AddFechaCreacionToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :fecha_creacion, :datetime
  end
end
