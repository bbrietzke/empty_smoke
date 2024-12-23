class Article < ApplicationRecord
    include PublicActivity::Model

    belongs_to :user
    validates :url, uniqueness: true
    tracked owner: ->(controller, model) { controller && controller.current_user || model.user }
end
