class WelcomeController < ApplicationController
  layout 'welcome'
  def index
    # redirect the user to units after login
    if user_signed_in?
      redirect_to units_path
    end
    
  end
end
