class AddTelefoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
  end
end
