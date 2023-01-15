class RenameLinkToAttachmentInBrowses < ActiveRecord::Migration[7.0]
  def change
    rename_column :browses, :link, :attachment
  end
end
