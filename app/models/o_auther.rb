class OAuther

  def self.authenticate(env_hash)
    if well_formed_hash?(env_hash)
      User.find_or_initialize_by(google_id: env_hash['uid'])
    else
      nil
    end
  end

  def self.well_formed_hash?(env_hash)
    env_hash['uid'] != nil && env_hash['info']['email'] != nil
  end

end
