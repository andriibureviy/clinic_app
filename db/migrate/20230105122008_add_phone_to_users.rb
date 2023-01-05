class AddPhoneToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone, :string
    add_column :admins, :phone, :string
    add_column :doctors, :phone, :string
  end
end
