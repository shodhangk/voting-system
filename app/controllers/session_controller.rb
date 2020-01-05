class SessionController < ApplicationController
  skip_before_action :authenticate_request
  before_action :validate_user_registration, only: [:register]

  def create
    authenticator = AuthenticateUser.call(params[:phone], params[:password])
    if authenticator.success?
      create_response({
                        auth_token: authenticator.result[0],
                        is_admin: authenticator.result[1]
                      }, response_code)
    else
      create_response(authenticator.errors, 401)
    end
  end

  def register
    if @voter.update(password: registration_params[:password])
      create_response('User is succesfully registered.', 200)
    else
      create_response(@voter.errors, 400)
    end
  end

  private

  def registration_params
    params.permit(:phone, :passcode, :password)
  end

  def validate_user_registration
    @voter = User.where(phone: registration_params[:phone],
                        verification_id: registration_params[:passcode]).last
    create_response('User is not enrolled. Please visit your near by Muncipal Office.',
                    400) if @voter.blank?
  end
end
