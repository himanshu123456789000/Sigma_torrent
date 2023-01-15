class RemoveTypeFromBrowse < ActiveRecord::Migration[7.0]
  def change
    remove_column :browses, :type, :string
  end
end
