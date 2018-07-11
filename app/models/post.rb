class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-fiction)}
  validate :clickbaity


  def clickbaity
    if !title.nil?
      if !["Won't Believe", "Secret","Top", "Guess"].any? {|phrase| title.include?(phrase)}
        errors.add(:title, "is not clickbait-y")
      end
    end
  end

end
