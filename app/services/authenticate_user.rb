#Used to authenticate the user
# Returns JWT token(@string) and is_admin(@boolean) 
class AuthenticateUser
  prepend SimpleCommand

  def initialize(phone, password)
    @phone = phone
    @password = password
  end

  def call
    [JsonWebToken.encode(user_id: user.id), user.instance_of?(Admin)] if user
  end

  private

  attr_accessor :phone, :password

  def user
    user = Admin.find_by_phone(phone)
    return user if user && user.authenticate(password)
    user = User.find_by_phone(phone)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
