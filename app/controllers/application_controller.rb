class ApplicationController < ActionController::Base
  include JsonResponseRender

  protect_from_forgery with: :null_session
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    create_response('Not Authorized', 401) unless @current_user
  end

  def admin?
    return @current_user.instance_of? Admin if @current_user
    false
  end

  def authenticate_admin
    create_response('User is not authorized to peform this action', 401) unless admin?
  end

  def authenticate_voter
    create_response('Admin is not authorized to peform this action', 401) if admin?
  end
end
