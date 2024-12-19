class CallbacksController < Devise::OmniauthCallbacksController
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end

    def mastodon
        puts request.env["omniauth.auth"]
        @user = User.from_mastodon(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
end