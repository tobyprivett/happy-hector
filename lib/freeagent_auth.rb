module OmniAuth
  module Strategies
    class FreeagentAuth < OmniAuth::Strategies::OAuth2
      AUTH_PROVIDER = ENV['FREEAGENT_OAUTH_PROVIDER']

      option :name, 'freeagent_auth'

      option :client_options,
             authorize_url: "#{AUTH_PROVIDER}/approve_app/",
             token_url: "#{AUTH_PROVIDER}/token_endpoint"

      uid { raw_info['user']['url'] }

      info do
        {
          first_name: raw_info['user']['first_name'],
          last_name: raw_info['user']['last_name'],
          email: raw_info['user']['email'],
          access_token: access_token
        }
      end

      def raw_info
        @raw_info ||= access_token.get("#{AUTH_PROVIDER}/users/me").parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
