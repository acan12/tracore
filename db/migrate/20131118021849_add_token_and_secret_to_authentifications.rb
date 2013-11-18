class AddTokenAndSecretToAuthentifications < ActiveRecord::Migration
  def change
    add_column :authentifications, :token, :string
    add_column :authentifications, :secret, :string
  end
end
