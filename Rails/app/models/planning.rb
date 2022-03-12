class Planning < ApplicationRecord
    has_many :friends_has_plannings, dependent: :destroy
    has_many :friends, through: :friends_has_plannings, before_add: :validate_friends_limit
    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

    validates :title, presence: true, allow_blank: false, :length => {:within => 1..255}
    validate :validateDate

    def to_json
        self.as_json.merge(creator:  self.creator.to_c_json ,friends: self.friends.map { |friend| friend.to_c_json.merge(accepted: self.friends_has_plannings.find_by(friend: friend).accepted_at)})
    end

    def validateDate
        if !date.present? || date < DateTime.now
            errors.add(:date, "La date ne peut pas être dans le passé")
        end
    end

    def validate_friends_limit(item)
        errors.add(:friends, "Il ne peut pas y avoir plus de 4 amis") if self.friends.size >= 4
    end
end
