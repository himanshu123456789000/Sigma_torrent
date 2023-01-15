class RemoveUploadedByFromBrowse < ActiveRecord::Migration[7.0]
  def change
    remove_column :browses, :uploaded_by, :string
  end
end
