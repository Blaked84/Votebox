class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  layout 'gorg_engine/application'

  require GorgEngine::Engine.config.root + 'app' + 'controllers' + self.name.underscore

  def access_denied(_exception)
    respond_to do |format|
      format.json { render nothing: true, status: :forbidden }
      format.html {
        store_location_for :user, request.fullpath
        if user_signed_in?
          render :file => "#{Rails.root}/public/403.html", :status => 403
        else
          redirect_to new_user_session_path
        end
      }
    end
  end

end
