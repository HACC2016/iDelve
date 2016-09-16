class Medium < ApplicationRecord
  has_attached_file :data
  #validates_attachment_content_type :data, content_type: /\Aimage\/.*\z/
  #validates :data, attachment_presence: true

  # change this later
  do_not_validate_attachment_file_type :data
end
