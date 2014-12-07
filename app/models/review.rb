class Review < ActiveRecord::Base

  belongs_to :business
  belongs_to :user

  validates_presence_of :business_id, :user_id
  # validates :rating, presence: true, inclusion: {in: 1..5,
                                                #  message: "Rating must be between 1 and 5 stars."
                                                # }
  # validates :content, presence: true, length: {minimum: 10}
  
end
