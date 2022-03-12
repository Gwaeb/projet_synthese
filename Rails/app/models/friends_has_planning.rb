class FriendsHasPlanning < ApplicationRecord
    belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'
    belongs_to :planning

    validate :validateDate


    def validateDate
        if accepted_at && accepted_at < Date.today
            errors.add(:accepted_at, "can't be in the past")
        end
    end

end
