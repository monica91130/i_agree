class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable;
  
  attachment :image

	has_many :posts
	has_many :agrees
	has_many :reqests
	has_many :user_follows
	has_many :category_follows
	has_many :categories, through: :category_follows
	has_many :posts, through: :user_follows
	has_many :posts, through: :agrees

  validates :name, uniqueness: true, presence: true, length: {minimum: 2, maximum: 20}

  enum gender: { male: 1, female: 2, unknown: 3}

  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能

  def remember_me
    true
  end



end
