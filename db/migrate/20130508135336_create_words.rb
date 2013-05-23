class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.string :transcription
      t.string :translation
      t.integer :progress
      t.text :example
      t.integer :user_id

      t.timestamps
    end
    add_index :words, [:user_id, :word, :created_at]
  end
end
