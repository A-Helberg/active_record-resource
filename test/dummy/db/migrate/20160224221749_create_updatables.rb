class CreateUpdatables < ActiveRecord::Migration
  def change
    create_table :updatables do |t|
      t.string :number

      t.timestamps null: false
    end
  end
end
