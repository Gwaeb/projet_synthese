class Category < ApplicationRecord
    has_one_attached :picture
    has_many :runes, dependent: :destroy

    validates :name, presence: true,uniqueness: true, allow_blank: false, :length => {:within => 1..255}
    validates :description, presence: true,uniqueness: true, allow_blank: false, :length => {:within => 4..255}

    
    def to_json
        self.as_json.merge(picture_path: rails_blob_path(self.picture, only_path: true))
    end

end
