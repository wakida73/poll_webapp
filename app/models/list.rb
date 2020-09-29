class List < ApplicationRecord
  belongs_to :poll #,inverse_of: :lists

  #validates :text, length: { in: 1..50 } 
end
