class Article < ApplicationRecord
    has_many :comments
    has_many :article_advertisements
    has_many :advertisements, through: :article_advertisements

    validates :content, presence:true
    # validate :check_length

    # def check_length
    #     if !self.content.nil? && self.content.length > 5
    #         errors.add(:content, "Too long")
    #     end
    # end

    def formatted_title
        self.title.upcase
    end
end
