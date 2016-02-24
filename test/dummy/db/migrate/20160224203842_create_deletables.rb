class CreateDeletables < ActiveRecord::Migration
  def change
    create_table :deletables do |t|
      t.string :number

      t.timestamps null: false
    end
  end
end
