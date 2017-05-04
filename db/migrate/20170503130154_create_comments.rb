class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.text :text

      t.timestamps null: false
    end
  end
end
