class CreateAuthentifications < ActiveRecord::Migration
  def change
    create_table :authentifications do |t|
      t.string :provider
      t.string :uid
      t.belongs_to :user

      t.timestamps
    end
  end
end
