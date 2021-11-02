class RemoveGenreFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :genre, :string
  end
end
