class ApplicationController < ActionController::Base
    # devise configuration
    before_action :authenticate_user!   	
    #cancancan configuration
    # load_and_authorize_resource

    rescue_from CanCan::AccessDenied do |exception|
        # redirect_to '/', :alert => exception.message
        render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    end
end
