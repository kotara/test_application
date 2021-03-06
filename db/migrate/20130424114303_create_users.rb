class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :nickname
      t.string :provider
      t.string :url
      t.string :authentication_token

      t.timestamps
    end
  end
end
