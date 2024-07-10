class Article < ApplicationRecord
    validates :title, presence: true
    validates :short_description, presence: true
    validates :description, presence: true

    has_one_attached :image
    has_one :like, as: :likeable
    has_many :comments

    def self.find_or_create_by_title(title)
        Article.find_or_create_by!(title: title)
    end

    def image_url
        Rails.application.routes.url_helpers.rails_blob_url(image, host: 'localhost:3002') if image.attached?
    end

    def article_likes
        like.likes
    end

    def article_dislikes
        like.dislikes
    end
end
