require "mastodon"

class UpdateMastodonUserJob < ApplicationJob
  queue_as :default

  def perform(user_id, token, social_url)
    user = User.find(user_id)

    if user.uid.nil?
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



# client = Mastodon::REST::Client.new(
#   base_url: "https://mastodon.social",
#   bearer_token: auth.credentials.token
# )
# u = client.verify_credentials()
# puts client.inspect
# puts u.inspect
