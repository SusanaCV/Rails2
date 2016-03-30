class RemovefechaExpiracionFromsessions < ActiveRecord::Migration
  def change
  remove_column :sessions, :fecha_expiracion, :datetime
  end
end
