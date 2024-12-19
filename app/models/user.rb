class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :omniauthable, omniauth_providers: [:github, :mastodon] # , :recoverable, :registerable, , :rememberable, :validatable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name
      user.username = auth.info.nickname
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end 

  def self.from_mastodon(auth)
    where(provider: auth.provider, username: auth.extra.raw_info.preferred_username).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name
      user.username = auth.extra.raw_info.preferred_username
      user.profile_url auth.extra.raw_info.profile
      user.email = auth.extra.raw_info.preferred_username + "@mastodon.social"
      user.password = Devise.friendly_token[0,20]
      user.token = auth.credentials.token
    end 
  end
end


    # client = Mastodon::REST::Client.new(
    #   base_url: "https://mastodon.social", 
    #   bearer_token: auth.credentials.token
    # )
    # u = client.verify_credentials()
    # puts client.inspect
    # puts u.inspect
    