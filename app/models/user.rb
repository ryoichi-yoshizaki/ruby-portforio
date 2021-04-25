# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  image                  :string
#  profile                :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  profile_image_id       :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ユーザーがレシピを多く持つ、ユーザーが削除されたらレシピも削除する
  has_many :recipes, dependent: :destroy
  attachment :profile_image
  
  validates :username,presence: true
end
# enum is_active: {Available: true, Invalid: false}
# #有効会員はtrue、退会済み会員はfalse

# def active_for_authentication?
#     super && (self.is_active === "Available")
# end
# #is_activeが有効の場合は有効会員(ログイン可能)

class User < ActiveRecord::Base
  mount_uploader :image, ImagesUploader
end