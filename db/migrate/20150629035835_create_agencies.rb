class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.text :description
      t.string :grade

      t.timestamps null: false
    end
  end
end
