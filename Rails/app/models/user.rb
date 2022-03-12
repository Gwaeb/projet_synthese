class User < ApplicationRecord

  has_one_attached :picture
  has_many :champion_wishlists, dependent: :destroy
  has_many :skin_wishlists, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :plannings, dependent: :destroy
  has_many :friends_has_plannings, dependent: :destroy
  has_many :builds, dependent: :destroy
  has_many :match_histories, dependent: :destroy
  has_many :rune_pages, dependent: :destroy

  validates :name, presence: true,uniqueness: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  
  def to_c_json
    self.as_json.merge(picture_path: Rails.application.routes.url_helpers.rails_blob_path(self.picture, only_path: true))
  end

end
