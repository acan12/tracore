class ModifyUsers < ActiveRecord::Migration
  def change
    cols = %w(encrypted_password reset_password_token reset_password_sent_at remember_created_at sign_in_count
       current_sign_in_at last_sign_in_at current_sign_in_ip last_sign_in_ip authentication_token)
    cols.each do |c|
      remove_column :users, c.to_sym
    end
    add_column :users, :password, :string
    add_column :users, :token, :string
    add_column :users, :mobile, :boolean
    add_column :users, :web, :boolean
    
    add_index :users, [:mobile, :web]
  end
end
