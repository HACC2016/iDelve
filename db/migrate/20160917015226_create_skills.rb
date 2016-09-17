class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :description
      t.belongs_to :medium
      t.belongs_to :user

      t.timestamps
    end
  end
end
