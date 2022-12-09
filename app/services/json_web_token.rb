class JsonWebToken
  hmac_secret = 'my$ecretK3y'

  def self.encode(payload)
    JWT.encode payload, hmac_secret, 'HS256'
  end

  def self.decode(token)
    JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
  end
end