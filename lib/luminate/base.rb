require 'uri'
require 'net/http'
require 'net/https'
require 'multi_json'
require 'map'

module Luminate
  class Base

    def self.def_endpoints(api,*endpoints)
      endpoints.each do |endpoint|
        method_name = endpoint.gsub(/(.)([A-Z])/,'\1_\2').downcase
        define_singleton_method method_name do |params|
          send_request(api,params.merge({method: endpoint}))
        end
      end
    end

    def self.send_request(api = '', params = {})
      raise 'No API specified' if api.empty?
      raise 'No method specified' if params[:method].nil?

      config = Luminate.config
      params.merge!(response_format: 'json',
                    v: '1.0',
                    api_key: config.api_key,
                    login_name: config.api_login,
                    login_password: config.api_password)

      url = URI.join(config.url,"#{config.organization}/",'site/',api)

      http = Net::HTTP.new(url.host, url.port)

      if url.port == 443
        http.use_ssl = true
      end

      req = Net::HTTP::Post.new(url.path)
      req.set_form_data(params)
      res = http.start { |http| http.request(req) }
      Map.for(parse_response(res.body))
    end

    # Converts the API response to a Hash
    def self.parse_response(raw)
      return {} if raw.to_s.empty?
      ::MultiJson.decode(raw)
    end
  end
end
