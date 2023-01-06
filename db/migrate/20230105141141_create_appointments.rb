class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :date_time

      t.timestamps
    end
  end
end
