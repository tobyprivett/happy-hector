def valid_omnniauth_user
  OmniAuth::AuthHash.new(
    provider: 'freeagent_auth',
    info: {
      email: 'alice@example.com',
      first_name: 'Alice',
      last_name: 'Arnold',
      url: 'http://test.local/user/1'
    }
  )
end

def login_as_omniauth_user
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:freeagent_auth] = valid_omnniauth_user
end
