class Post < ApplicationRecord
  include Likeable

  belongs_to :user
  belongs_to :post, optional: true
  has_many :comments, dependent: :destroy

  validates :body, length: { maximum: 240 }, allow_blank: false, unless: :post_id

  def post_type
    case
    when post_id? && body?
      :quote_repost
    when post_id?
      :repost
    else
      :post
    end
  end
end
