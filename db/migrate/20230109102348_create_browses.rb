class CreateBrowses < ActiveRecord::Migration[7.0]
  def change
    create_table :browses do |t|
      t.string :type
      t.string :name
      t.string :link
      t.string :size
      t.string :uploaded_by

      t.timestamps
    end
  end
end
