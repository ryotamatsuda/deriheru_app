class HomeController < ApplicationController
  before_action :not_access_of_login_user, only: [:top]
  def top
  end
end
