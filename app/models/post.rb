class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait_title

  @clickbait_words = [/won't believe/, /secret/, /top \d/, /guess/]

  def clickbait_title
    if !self.title.downcase.include?(@clickbait_words)
      errors.add(:title, "Not clickbait-y")
    end
  end
end
