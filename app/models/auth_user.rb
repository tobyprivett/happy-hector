class AuthUser
  include ActiveModel::Model

  attr_accessor(
    :uid,
    :email,
    :first_name,
    :last_name,
    :access_token
  )

  AuthHashError = Class.new(RuntimeError)

  class << self
    def from_omniauth_hash(auth_hash = {})
      raise AuthHashError unless auth_hash[:uid]

      AuthUser.new(
        uid: auth_hash[:uid],
        email: auth_hash[:info][:email],
        first_name: auth_hash[:info][:first_name],
        last_name: auth_hash[:info][:last_name],
        access_token: auth_hash[:info][:access_token]
      )
    end
  end
end
