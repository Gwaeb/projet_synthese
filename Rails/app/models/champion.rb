class Champion < ApplicationRecord
    has_one_attached :picture
    has_many :skins, dependent: :destroy
    has_many :champion_wishlists, dependent: :destroy
    has_many :match_histories, dependent: :destroy

    validates :name, presence: true,uniqueness: true, allow_blank: false, :length => {:within => 1..255}
    validates :description, presence: true,uniqueness: true, allow_blank: false, :length => {:within => 4..255}
    validates :price, numericality: { greater_than: 0 }
    validates :position, :inclusion => 0..4

    def to_json
        self.as_json.merge(picture_path: Rails.application.routes.url_helpers.rails_blob_path(self.picture, only_path: true))
    end
end
