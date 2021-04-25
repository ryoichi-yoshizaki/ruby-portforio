# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :string
#  user_id    :integer
#
class Recipe < ApplicationRecord
    belongs_to :user
    attachment :image

    with_options presence: true do
        validates :title
        validates :body
        
    end
end
