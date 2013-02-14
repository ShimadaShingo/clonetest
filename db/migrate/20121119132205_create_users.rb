class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_kana
      t.string :first_kana
      t.string :contact1
      t.string :contact2
      t.string :contact3
      t.string :mail1
      t.string :mail2
      t.string :mail3
      t.integer :authlevel
      t.string :pw
      t.string :notice
      t.string :sendmail
      t.string :create_user
      t.string :update_user
      t.integer :lock_version
      t.timestamps
    end
  end
end
