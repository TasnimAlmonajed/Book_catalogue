class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.text :short_description

      t.timestamps
    end
  end
end
