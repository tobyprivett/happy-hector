def valid_omnniauth_user
  OmniAuth::AuthHash.new(
    provider: 'freeagent_auth',
    uid: 'http://test.local/user/1',
    info: {
      email: 'alice@example.com',
      first_name: 'Alice',
      last_name: 'Arnold',
      access_token: 'FOO'
    }
  )
end

def enable_omniauth_user
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:freeagent_auth] = valid_omnniauth_user
end
