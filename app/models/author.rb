class Author < ApplicationRecord
    # validates :name, presence:true, uniqueness: true
    # validates :address, presence:true
    # validates :date, presence:true
    # validate :validate_date

    # def validate_date
    #     if !self.date.nil? && self.date > Date.today
    #         errors.add(:date, "Date should not be later than today.")
    #     end
    # end
end
