class RemoveSizeFromBrowse < ActiveRecord::Migration[7.0]
  def change
    remove_column :browses, :size, :string
  end
end
