class GroupPoll < ApplicationRecord
  belongs_to :poll
  belongs_to :group
end
