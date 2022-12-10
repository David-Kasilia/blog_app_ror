class JsonWebToken
  JWT_SECRET = ENV.fetch('JWT_SECRET', nil)

  def self.encode(payload)
    # expiration = 7.days.from_now
    JWT.encode(payload, JWT_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, JWT_SECRET)[0]
    HashWithIndifferentAccess.new body
  end
end
