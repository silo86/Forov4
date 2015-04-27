class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
