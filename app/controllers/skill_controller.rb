require 'bundler/setup'
require 'docx_templater'


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

  def show_resume
    send_data generate_resume(current_user),
              filename: "#{current_user.email}.docx",
              type: "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
              disposition: 'inline'
  end


  private

  def skill_params
    params.permit(:description)
  end

  def generate_resume(user)
    # TODO: user.skills -> data for resume
    @data = {
      name: 'Priya Vora',
      street: '14 Some Place',
      city: 'Honolulu',
      state: 'HI',
      zip_code: '96821',
      phone: '808-735-5555',
      email: 'priya@pvora.org',
      experience: [
        { job_date: 'Feb 2016 to present',
          job_experience: 'Foodland Market City' },
        { job_date: 'Feb 2015 to Dec 2015',
          job_experience: 'McDonalds Kaimukit' },
        { job_date: 'Oct 2014 to Feb 2015',
          job_experience: 'Hilo Hattie' },
        { job_date: 'Jun 2013 to July 2014',
          job_experience: 'Goodwill Industries' },
        { job_date: 'Jun 2012 to July 2013',
          job_experience: 'Lanakila' },
        { job_date: 'Jun 2011 to July 2012',
          job_experience: 'McDonalds Kaimuki' },
        { job_date: 'Jan 2011 to Jun 2011',
          job_experience: 'Goodwill Industries' },
        { job_date: 'Aug 2010 to Jan 2011',
          job_experience: 'Lanakila' },
        { job_date: 'Jun 2009 to July 2010',
          job_experience: 'Goodwill Industries' },
        { job_date: 'Jun 2008 to July 2009',
          job_experience: 'Lanakila' }
      ],
      education: [
        { education_date: 'Jun 2008',
          education_description: 'Lanakila School' },
        { education_date: 'Jun 2007',
          education_description: 'Jefferson Elementary School' }
      ],
      skill: [
        { skill_category: 'Reading Level',
          skill_list: '6th grade' },
        { skill_category: 'Basic Math',
          skill_list: 'count inventory, simple addition and subtraction' },
        { skill_category: 'Independent Work',
          skill_list: 'restock shelves, sweep floor, mop floor, throw out trash' },
      ]
    }

    template = 'lib/assets/template-resume.docx'
    DocxTemplater::DocxCreator.new(template, @data).generate_docx_bytes().string
  end
end
