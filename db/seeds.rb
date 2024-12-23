# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.find_or_create_by(email: "noreply@empty-smoke.org") do |user|
    user.name = "The Operator"
    user.encrypted_password = "NONONONONONONONONONONO"
    user.username = "the_operator"
end

[
    "https://guides.rubyonrails.org/"
].each do |a|
    operator = User.find_or_create_by(email: "noreply@empty-smoke.org")
    operator.articles.find_or_create_by(url: a) do |article|
        puts article.inspect
    end
end
