class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :smart_backlink_session
  before_action :ref_to_cookie

  protected
  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
  
  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    
  end
  
  def ref_to_cookie
    return if !params[:ref]
    unless User.find_by_referral_code(params[:ref]).nil?
      h_ref = { value: params[:ref], expires: 1.week.from_now }
      cookies[:h_ref] = h_ref
    end
    redirect_to proc { url_for(params.except(:ref)) }
  end

  def smart_backlink_session
    # Clear all other links when on home page - my preference
    delete_session_paths_visited_if_on_dashboard
    
    route_name = Rails.application.routes.router.recognize(request) { |route, _| route.name }.flatten.last.name
    
    # This global variable will be passed to our views
    @path_name = "#{request.env['ORIGINAL_FULLPATH']}"
    
    # We keep track on all page visited
    # Do not add same path more than once in the array ie if user refreshes browser
    session[:paths_visited] << @path_name if session[:paths_visited] and !session[:paths_visited].include?(@path_name)
  end
  
  # Delete and recreate the session with only the dashboard path in its array - again, my prefrence
  def delete_session_paths_visited_if_on_dashboard
    if request.env['ORIGINAL_FULLPATH'] == '/dashboard'
      session.delete(:paths_visited)
      # Check if your version of ruby supports "if not" or use unless
      session[:paths_visited] = Array.new(1, dashboard_path) if not session[:paths_visited]
    end
  end
end
