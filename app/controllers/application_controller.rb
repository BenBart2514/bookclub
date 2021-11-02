class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::Error, with: :nope

  private

  def forbidden
    flash[:alert] = 'You are not authorized to perform that action!'
    redirect_to(request.referrer || root_path)
  end

  def nope
    flash[:alert] = 'Nah m8, canny do that!'
    redirect_to(request.referrer || root_path)
  end
end
