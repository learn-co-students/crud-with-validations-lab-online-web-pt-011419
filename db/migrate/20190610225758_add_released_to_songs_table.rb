class AddReleasedToSongsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :released, :string
  end
end
