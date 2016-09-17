class IdelveController < ApplicationController
  before_action :authenticate_user!

  skip_before_action :verify_authenticity_token

  def new
  end

  def home
  end

  def list_of_twenty
  end

  def iam
  end

  def iwish
  end

  def iconnect
  end

end
