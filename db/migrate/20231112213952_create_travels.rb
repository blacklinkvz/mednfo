class CreateTravels < ActiveRecord::Migration[7.1]
  def change
    create_table :travels do |t|
      t.string :name
      t.date :start_date
      t.date :finish_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
