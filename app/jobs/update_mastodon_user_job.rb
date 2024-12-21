require "mastodon"

class UpdateMastodonUserJob < ApplicationJob
  queue_as :default

  def perform(user_id, token, social_url)
    user = User.find(user_id)

    if user.uid.blank?
      client = Mastodon::REST::Client.new(
        base_url: social_url,
        bearer_token: token
      )
  
      mastodon_user = client.verify_credentials()
  
      user.uid = mastodon_user.id
      user.save
    end
  end
end
