class CreateAuthentifications < ActiveRecord::Migration
  def change
    create_table :authentifications do |t|
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.string :expires_at
      t.belongs_to :user

      t.timestamps
    end
  end
end
