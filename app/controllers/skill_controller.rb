class SkillController < ApplicationController
  def create
    @skill = Skill.create( skill_params )

    if (params[:use_last_upload]) then
      @skill.medium = Medium.find( current_user.lastupload )
    end

    @skill.user = current_user

    @skill.save!
  end


  def list
    @skills = current_user.skills
  end

  def add
    @skill = Skill.new

    current_user.lastscreen = skill_add_url
    current_user.save!
  end

  private

  def skill_params
    params.permit(:description)
  end
end
