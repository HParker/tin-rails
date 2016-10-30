class Authorization < ApplicationRecord
  belongs_to :user
  validates :provider, :uid, :presence => true

  def self.from_auth_hash(auth_hash)
    unless auth = find_by(provider: auth_hash.provider, uid: auth_hash.uid)
      user = User.new(name: auth_hash.info.name, email: auth_hash.info.email, image_url: auth_hash.info.image)
      user.authorizations.build(user: user, provider: auth_hash.provider, uid: auth_hash.uid)
      user.save!
      auth = find_by(provider: auth_hash.provider, uid: auth_hash.uid)
    end
    auth
  end
end
