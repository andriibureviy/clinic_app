class CreateDoctorsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :open_records_count, default: 0

      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :recommendation

      t.timestamps
    end

    create_table :doctor_user_communications do |t|
      t.references :doctor, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :doctor_user_communications, [:doctor_id, :user_id], unique: true
  end
end