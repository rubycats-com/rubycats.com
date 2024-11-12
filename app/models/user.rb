class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :omniauthable, omniauth_providers: [ :github ]
  has_many :likes

  def self.find_for_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.encrypted_password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.avatar_url = auth.extra.raw_info.avatar_url
      user.nickname = auth.info.nickname
    end
  end
end
