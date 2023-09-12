module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likeable
  end

  def liked_by?(user)
    likes.where(user: user).any?
  end

  def liked_by(user)
    likes.create(user: user)
  end

  def unliked_by(user)
    likes.find_by(user: user).destroy
  end
end