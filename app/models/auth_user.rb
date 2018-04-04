class AuthUser
  include ActiveModel::Model

  attr_accessor(
    :email,
    :first_name,
    :last_name,
    :url
  )

  AuthHashError = Class.new(RuntimeError)

  class << self
    def from_omniauth_hash(auth_hash = {})
      info = auth_hash[:info]

      raise AuthHashError if info.blank?

      AuthUser.new(
        email: info[:email],
        first_name: info[:first_name],
        last_name: info[:last_name],
        url: info[:url]
      )
    end
  end
end
