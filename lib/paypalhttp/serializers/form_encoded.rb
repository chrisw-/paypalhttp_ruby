require 'uri'

module PayPalHttp
  class FormEncoded
    def encode(request)
      encoded_params = []
      request.body.each do |k, v|
        encoded_params.push("#{URI::DEFAULT_PARSER.escape(k.to_s)}=#{URI::DEFAULT_PARSER.escape(v.to_s)}")
      end

      encoded_params.join("&")
    end

    def decode(body)
      raise UnsupportedEncodingError.new("FormEncoded does not support deserialization")
    end

    def content_type
      /^application\/x-www-form-urlencoded/
    end
  end
end
