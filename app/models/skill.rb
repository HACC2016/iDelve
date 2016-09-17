class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :medium

  def list
    @skills = current_user.skills
  end
end
