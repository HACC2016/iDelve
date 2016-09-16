class AddAttachmentDataToMedia < ActiveRecord::Migration
  def self.up
    change_table :media do |t|
      t.attachment :data
    end
  end

  def self.down
    remove_attachment :media, :data
  end
end
