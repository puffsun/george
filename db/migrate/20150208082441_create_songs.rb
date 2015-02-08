class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :title
      t.text :lyrics
      t.integer :length
      t.date :released_on

      t.timestamps
    end

    add_index :songs, :title
  end

  def self.down
    drop_table :songs
  end
end
