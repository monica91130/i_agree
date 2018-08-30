class Post < ApplicationRecord
  	default_scope -> { order(created_at: :desc) }
	validates :category_id, presence: true
	validates :body, presence: true

	belongs_to :user
	belongs_to :category
	# belongs_to :tag
	has_many :user_follow, dependent: :destroy
	has_many :agrees, dependent: :destroy
	has_many :users, through: :user_follows
	has_many :users, through: :agrees
	has_many :categories, through: :category_follows

	scope :body_like, -> body{ where('body like ?', "%#{body}%") if body.present?}

	# def agreed_by? (user)
	# 	agrees.where(user_id: user.id).exists?
	# end

	# def self.search(search) #self.でクラスメソッドとしている
	#     if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	#     	# binding.pry
	#        Post.where(['body LIKE ?', "%#{search}%"])
	#     end
 # 	end
end
