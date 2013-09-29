class Book < ActiveRecord::Base
	belongs_to :user
	#future should have most popular one first, not by date
	default_scope -> { order('created_at DESC')}
	validates :title, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true
end
