class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :img_url
      t.boolean :sold, default: false
    end
  end
end
