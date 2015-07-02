class AddImagemToProduct < ActiveRecord::Migration
  def change
    add_column :products, :imagem, :string
  end
end
