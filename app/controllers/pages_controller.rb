class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def onboarding
  end

  def home
    if user_signed_in?
      redirect_to dashboard_path
    end
  end
end
