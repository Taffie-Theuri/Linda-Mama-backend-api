class Patients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :age
      t.string :birthdate
      t.boolean :doc
      t.string  :email
      t.string :password

      t.timestamps

    end

  end
end
