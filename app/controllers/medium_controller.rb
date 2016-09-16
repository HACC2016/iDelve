class MediumController < ApplicationController
  def create
    @medium = Medium.create( medium_params )
    @medium.data = params[:medium][:data]
  end

  def new
    @medium = Medium.new(  )
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def medium_params
    params.require(:medium).permit(:data)
  end

end
