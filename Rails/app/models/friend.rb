class Friend < ApplicationRecord
    belongs_to :ask, class_name: 'User', foreign_key: 'ask_id', dependent: :destroy
    belongs_to :receive, class_name: 'User', foreign_key: 'receive_id', dependent: :destroy

end