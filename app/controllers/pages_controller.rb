class PagesController < ApplicationController
  def refer
    @user = User.find_by_email(cookies[:h_email])

    respond_to do |format|
        if @user.nil?
        format.html { redirect_to root_path, alert: 'Something went wrong!' }
        else
        format.html # refer.html.erb
        end
    end
  end
    
end
