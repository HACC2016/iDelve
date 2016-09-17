class MediumController < ApplicationController
  def create
    @medium = Medium.create( medium_params )

    @medium.user_id = current_user.id
    @medium.save!

    current_user.lastupload = @medium.id
    current_user.save!
  end

  def new
    @medium = Medium.new
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def medium_params
    params.require(:medium).permit(:data)
  end

end
