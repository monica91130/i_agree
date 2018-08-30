class Category < ApplicationRecord
	# has_many :tags
	has_many :posts
	# has_many :category_follows
	# has_many :users, through: :category_follows
	attachment :image

	scope :with_posts, -> { joins(:posts).merge(Post.recent) }
	scope :recent_like, -> name{ where('name like ?', "%#{name}%") if name.present?}

end
