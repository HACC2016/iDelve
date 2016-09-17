class AddLastuploadToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lastupload, :integer
  end
end
